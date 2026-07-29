Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCF369D57
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359101; cv=none; b=JDqJsI70GycILFG/ttd8iD5YExhHmDk8Zfzg/D6ah1XpijYOc4/70EdkHC1EWEZ9vHH3s+Dwdopf54JE4cP9ohF1XgY7Zvr5fcoR3ZZ1yjnqlDzn090eeF0mIeoT9sXjNpPS17VR0Dpkoq2yguI9v1DoyH3ugIUwlWUiL2y3QxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359101; c=relaxed/simple;
	bh=yM+/qbTVrIG10n+UJdtFs2x4IoQW1l1OTXqY4e63N3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qgfe+xpY5P16qdBw6PdWaVexFDDV/EVcyAI0UZSFZYHl4eb8Daxn20maB5Iw1T0d/xnjgaDtzSMBD2Zvz/U5IPf3nfiioGLrMtLHvVvBSidW56oE4OGYar8FdAX3Zxe7RHDlv+GvpkD9RIImXtDeODPyZK/hKA9IbbrV3/1/CEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERVIX6Bz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERVIX6Bz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785359086; x=1816895086;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yM+/qbTVrIG10n+UJdtFs2x4IoQW1l1OTXqY4e63N3Y=;
  b=ERVIX6BzV0nnN3oWhTeYJN0TrmaDWQJATKb7ilY8ELY3Tv8IwmJ2eeIW
   Y/zZed/LDeZcopo0dhJSOGl0uGto15iUQQWggKbH9KHnOudZtl5FckRZ9
   fQq+jSBOuYqizorB6Fi2lenQgAEShJ4+doHoLTU0vJAyX3BDhBeyI68H+
   GRmVxPm8fHgKCp8398RcRtSHzhgDlgLT7mQHowell2pAWkdCbo7A1Bzhf
   4bBKBpyvOsKpU+HbhnWap9e9m1lMEWluw2ekwfvKkK2Z01/pzImGu1Zo7
   tBEtH3/tm6ViDNRzhVMvrABIs7jsh5c8FVlRd+dIhhxm/EExSD1YvaVq+
   w==;
X-CSE-ConnectionGUID: e8Aa47V9Sv6KaxVGo32WpQ==
X-CSE-MsgGUID: 3Di8SoQlSW6Bl7hlHMtOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86053108"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86053108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 14:04:45 -0700
X-CSE-ConnectionGUID: U87K0X0tTeW9FlxSOQOW2A==
X-CSE-MsgGUID: nvUOqdspTsydhOSrbGX2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256185319"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 14:04:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpBSC-000000002CY-1081;
	Wed, 29 Jul 2026 21:04:40 +0000
Date: Wed, 29 Jul 2026 23:04:02 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 66/165]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /
 (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
Message-ID: <202607292219.3CqIKezx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   d474f732e037129a4c3b84d3f0bd1433365bd11f
commit: 010b82dfd8362f9e5b41df353638b717e6e84adb [66/165] arm64: dts: build=
 overlays for bpi-r4-lite emmc/sd + nand/nor
config: arm64-randconfig-2054-20260728 (https://download.01.org/0day-ci/arc=
hive/20260729/202607292219.3CqIKezx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 952=
1d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260729/202607292219.3CqIKezx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607292219.3CqIKezx-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'm=
ediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'm=
ediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one mu=
st be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be f=
ixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 / (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0, 1073741=
824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 opp_table0 (operating-points-v2): $nodename:0: 'opp_table0' does not match=
 '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 opp_table0 (operating-points-v2): Unevaluated properties are not allowed (=
'opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 l2-cache (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 clkitg (simple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\=
\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 soc_clksys (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z]=
[a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/infracfg@10001000: failed to match any schema with compatible:=
 ['mediatek,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/topckgen@1001b000: failed to match any schema with compatible:=
 ['mediatek,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/apmixedsys@1001e000: failed to match any schema with compatibl=
e: ['mediatek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@10060000: failed to match any schema with compatible: [=
'mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-=
mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@10060000: failed to match any schema with compatible: [=
'mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-=
mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@10060000/pcs: failed to match any schema with compatibl=
e: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@10070000: failed to match any schema with compatible: [=
'mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-=
mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@10070000: failed to match any schema with compatible: [=
'mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-=
mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@10070000/pcs: failed to match any schema with compatibl=
e: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/mcusys@10400000: failed to match any schema with compatible: [=
'mediatek,mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@15000000: failed to match any schema with compatible: [=
'mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@15000000: failed to match any schema with compatible: [=
'mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_clksys/syscon@15000000/reset-controller: failed to match any schema w=
ith compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with =
compatible: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be f=
ixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek=
,hwver', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: =
['mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/pinctrl@1001f000: failed to match any schema with compatible: ['media=
tek,mt7987-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['medi=
atek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not=
 match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional faile=
d, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,=
mt7987-pwm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-=
?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#addres=
s-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-=
bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional f=
ailed, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required =
property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,=
mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional f=
ailed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/spi@11009800: failed to match any schema with compatible: ['mediatek,=
mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' do=
es not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: '=
rx_imp' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['i=
ntr', 'auto_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [=
30]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' do=
es not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-names: ['i=
ntr', 'rx_imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: [[31], [=
32], [33], [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000' does n=
ot match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb-phy@11c50000 (mediatek,mt7987): compatible: 'oneOf' conditional failed=
, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/usb-phy@11c50000: failed to match any schema with compatible: ['media=
tek,mt7987', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 usb@11200000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt7987-xhci' =
is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt=
7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt798=
6-xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-x=
hci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8189-xhci=
', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,=
mt7987-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names: ['aud_bus_ck=
', 'aud_26m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel', 'aud_i2=
s_m'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13], [22, 1=
4], [22, 15], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' w=
as expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:5: 'sel' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i2s_m' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 audio-controller@11210000 (mediatek,mt7987-afe): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/audio-controller@11210000: failed to match any schema with compatible=
: ['mediatek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mmc@11230000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'ax=
i_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], =
[22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek=
,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek=
,wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek=
,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek=
,mt7987-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/topmisc@10021000: failed to match any schema with compatible: ['media=
tek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/topmisc@10021000: failed to match any schema with compatible: ['media=
tek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 efuse@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional failed, o=
ne must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/devapc@1a110000: failed to match any schema with compatible: ['mediat=
ek,mt7987-devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 soc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z]=
[a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 syscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-e=
thwarp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 syscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_netsys/ethernet@15100000: failed to match any schema with compatible:=
 ['mediatek,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_netsys/hnat@15000000: failed to match any schema with compatible: ['m=
ediatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 crypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not match any=
 of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 crypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is a requi=
red property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 crypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0=
', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 crypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4]=
, [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' cond=
itional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7981-crypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc_netsys/crypto@15600000: failed to match any schema with compatible: [=
'inside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 mikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /mikro-bus/gpio-export@0: failed to match any schema with compatible: ['gp=
io-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 gpio-3: 'gpio-export,name', 'gpio-export,output' do not match any of the r=
egexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-k=
ey|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpm=
c),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|p=
xa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|s=
t-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '=
^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-=
9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^ab=
b,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '=
^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netw=
ork,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis=
,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^=
alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '=
^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^=
ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^and=
estech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ar=
ies,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.=
*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*',=
 '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '=
^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*',=
 '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis=
,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', =
'^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtr=
eetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^bo=
e,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',=
 '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byted=
ance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^c=
ameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cata=
lyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*'=
, '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea=
,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^ch=
rp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*',=
 '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^=
cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^c=
ongatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', =
'^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*=
', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^=
cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*'=
, '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell=
,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*',=
 '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimo=
noff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*'=
, '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dong=
woon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,=
.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*',=
 '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^e=
dt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*'=
, '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elim=
o,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,=
.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^e=
nclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^=
engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*=
', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fa=
irphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fe=
ixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipk=
art,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^f=
reebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuj=
itsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^=
gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,=
.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '=
^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '=
^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico=
,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '=
^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^ha=
oyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', =
'^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^h=
isilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynet=
ek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', =
'^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^i=
magis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostart=
ec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^=
ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*',=
 '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercon=
trol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '=
^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*'=
, '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.=
*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', =
'^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^k=
eithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*=
', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*=
', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*=
', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^l=
ctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.=
*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*=
', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,=
.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.=
*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*'=
, '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,=
.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^=
lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboar=
d,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlin=
ear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*',=
 '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^=
melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', =
'^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^mic=
rel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*'=
, '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke=
,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', =
'^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^m=
obileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,=
.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrv=
l,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*',=
 '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*',=
 '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pa=
rticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^ph=
icomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$'=
, '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,=
.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polar=
oid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^po=
v,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primevie=
w,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,=
.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*=
', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '=
^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,=
.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', =
'^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotic=
s,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,=
.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '=
^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^s=
aef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^san=
disk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schul=
ercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^s=
eirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek=
,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^shar=
p,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^s=
i-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sif=
lower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^=
silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silico=
nmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^s=
inowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,=
.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^sm=
i,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*=
', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*',=
 '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*=
', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson=
,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,=
.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summ=
it,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^s=
wir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^tai=
guanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*=
', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '=
^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '=
^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vsco=
m,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,=
.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwav=
e,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*=
', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*=
', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvi=
sion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', =
'^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*',=
 '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-=
optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones=
-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zar=
link,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*',=
 '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 gpio-4: 'gpio-export,name', 'gpio-export,output' do not match any of the r=
egexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-k=
ey|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpm=
c),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|p=
xa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|s=
t-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '=
^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-=
9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^ab=
b,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '=
^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netw=
ork,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis=
,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^=
alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '=
^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^=
ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^and=
estech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ar=
ies,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.=
*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*',=
 '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '=
^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*',=
 '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis=
,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', =
'^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtr=
eetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^bo=
e,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',=
 '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byted=
ance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^c=
ameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cata=
lyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*'=
, '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea=
,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^ch=
rp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*',=
 '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^=
cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^c=
ongatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', =
'^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*=
', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^=
cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*'=
, '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell=
,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*',=
 '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimo=
noff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*'=
, '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dong=
woon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,=
.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*',=
 '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^e=
dt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*'=
, '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elim=
o,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,=
.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^e=
nclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^=
engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*=
', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fa=
irphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fe=
ixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipk=
art,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^f=
reebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuj=
itsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^=
gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,=
.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '=
^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '=
^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico=
,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '=
^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^ha=
oyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', =
'^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^h=
isilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynet=
ek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', =
'^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^i=
magis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostart=
ec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^=
ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*',=
 '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercon=
trol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '=
^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*'=
, '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.=
*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', =
'^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^k=
eithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*=
', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*=
', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*=
', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^l=
ctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.=
*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*=
', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,=
.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.=
*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*'=
, '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,=
.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^=
lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboar=
d,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlin=
ear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*',=
 '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^=
melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', =
'^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^mic=
rel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*'=
, '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke=
,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', =
'^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^m=
obileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,=
.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrv=
l,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*',=
 '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*',=
 '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pa=
rticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^ph=
icomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$'=
, '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,=
.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polar=
oid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^po=
v,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primevie=
w,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,=
.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*=
', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '=
^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,=
.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', =
'^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotic=
s,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,=
.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '=
^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^s=
aef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^san=
disk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schul=
ercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^s=
eirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek=
,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^shar=
p,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^s=
i-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sif=
lower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^=
silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silico=
nmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^s=
inowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,=
.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^sm=
i,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*=
', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*',=
 '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*=
', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson=
,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,=
.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summ=
it,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^s=
wir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^tai=
guanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*=
', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '=
^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '=
^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vsco=
m,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,=
.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwav=
e,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*=
', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*=
', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvi=
sion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', =
'^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*',=
 '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-=
optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones=
-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zar=
link,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*',=
 '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 gpio-5: 'gpio-export,name', 'gpio-export,output' do not match any of the r=
egexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-k=
ey|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpm=
c),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|p=
xa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|s=
t-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '=
^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-=
9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^ab=
b,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '=
^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netw=
ork,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis=
,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^=
alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '=
^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^=
ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^and=
estech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ar=
ies,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.=
*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*',=
 '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '=
^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*',=
 '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis=
,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', =
'^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtr=
eetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^bo=
e,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',=
 '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byted=
ance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^c=
ameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cata=
lyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*'=
, '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea=
,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^ch=
rp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*',=
 '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^=
cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^c=
ongatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', =
'^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*=
', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^=
cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*'=
, '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell=
,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*',=
 '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimo=
noff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*'=
, '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dong=
woon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,=
.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*',=
 '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^e=
dt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*'=
, '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elim=
o,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,=
.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^e=
nclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^=
engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*=
', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fa=
irphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fe=
ixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipk=
art,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^f=
reebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuj=
itsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^=
gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,=
.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '=
^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '=
^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico=
,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '=
^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^ha=
oyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', =
'^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^h=
isilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynet=
ek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', =
'^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^i=
magis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostart=
ec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^=
ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*',=
 '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercon=
trol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '=
^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*'=
, '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.=
*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', =
'^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^k=
eithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*=
', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*=
', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*=
', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^l=
ctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.=
*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*=
', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,=
.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.=
*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*'=
, '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,=
.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^=
lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboar=
d,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlin=
ear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*',=
 '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^=
melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', =
'^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^mic=
rel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*'=
, '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke=
,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', =
'^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^m=
obileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,=
.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrv=
l,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*',=
 '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*',=
 '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pa=
rticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^ph=
icomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$'=
, '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,=
.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polar=
oid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^po=
v,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primevie=
w,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,=
.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*=
', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '=
^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,=
.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', =
'^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotic=
s,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,=
.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '=
^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^s=
aef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^san=
disk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schul=
ercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^s=
eirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek=
,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^shar=
p,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^s=
i-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sif=
lower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^=
silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silico=
nmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^s=
inowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,=
.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^sm=
i,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*=
', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*',=
 '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*=
', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson=
,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,=
.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summ=
it,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^s=
wir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^tai=
guanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*=
', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '=
^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '=
^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vsco=
m,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,=
.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwav=
e,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*=
', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*=
', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvi=
sion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', =
'^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*',=
 '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-=
optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones=
-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zar=
link,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*',=
 '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 gpio-6: 'gpio-export,name', 'gpio-export,output' do not match any of the r=
egexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-k=
ey|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpm=
c),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|p=
xa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|s=
t-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '=
^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-=
9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^ab=
b,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '=
^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netw=
ork,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis=
,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^=
alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '=
^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^=
ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^and=
estech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ar=
ies,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.=
*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*',=
 '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '=
^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*',=
 '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis=
,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', =
'^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtr=
eetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^bo=
e,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',=
 '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byted=
ance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^c=
ameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cata=
lyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*'=
, '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea=
,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^ch=
rp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*',=
 '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^=
cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^c=
ongatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', =
'^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*=
', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^=
cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*'=
, '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell=
,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*',=
 '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimo=
noff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*'=
, '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dong=
woon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,=
.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*',=
 '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^e=
dt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*'=
, '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elim=
o,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,=
.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^e=
nclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^=
engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*=
', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fa=
irphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fe=
ixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipk=
art,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^f=
reebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuj=
itsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^=
gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,=
.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '=
^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '=
^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico=
,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '=
^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^ha=
oyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', =
'^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^h=
isilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynet=
ek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', =
'^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^i=
magis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostart=
ec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^=
ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*',=
 '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercon=
trol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '=
^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*'=
, '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.=
*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', =
'^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^k=
eithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*=
', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*=
', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*=
', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^l=
ctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.=
*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*=
', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,=
.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.=
*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*'=
, '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,=
.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^=
lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboar=
d,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlin=
ear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*',=
 '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^=
melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', =
'^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^mic=
rel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*'=
, '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke=
,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', =
'^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^m=
obileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,=
.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrv=
l,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*',=
 '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*',=
 '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pa=
rticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^ph=
icomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$'=
, '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,=
.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polar=
oid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^po=
v,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primevie=
w,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,=
.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*=
', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '=
^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,=
.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', =
'^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotic=
s,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,=
.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '=
^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^s=
aef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^san=
disk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schul=
ercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^s=
eirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek=
,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^shar=
p,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^s=
i-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sif=
lower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^=
silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silico=
nmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^s=
inowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,=
.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^sm=
i,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*=
', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*',=
 '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*=
', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson=
,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,=
.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summ=
it,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^s=
wir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^tai=
guanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*=
', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '=
^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '=
^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vsco=
m,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,=
.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwav=
e,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*=
', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*=
', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvi=
sion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', =
'^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*',=
 '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-=
optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones=
-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zar=
link,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*',=
 '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /mikro-bus/gpio-export@1: failed to match any schema with compatible: ['gp=
io-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 gpio-46: 'gpio-export,name', 'gpio-export,output' do not match any of the =
regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-=
key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mp=
mc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|=
pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|=
st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', =
'^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0=
-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^a=
bb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*',=
 '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*',=
 '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi=
,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', =
'^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-net=
work,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesi=
s,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '=
^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', =
'^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '=
^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^an=
destech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*'=
, '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '=
^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^a=
ries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,=
.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*'=
, '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', =
'^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*'=
, '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axi=
s,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*',=
 '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigt=
reetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^b=
oe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*'=
, '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byte=
dance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^=
cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cat=
alyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*=
', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipide=
a,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^c=
hrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*'=
, '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '=
^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^=
congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*',=
 '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.=
*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '=
^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*=
', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^del=
l,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*=
', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^don=
gwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve=
,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*'=
, '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^=
edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*=
', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^eli=
mo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid=
,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^=
enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '=
^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.=
*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^e=
verest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^e=
xegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^f=
airphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^f=
eixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flip=
kart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^=
freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fu=
jitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '=
^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef=
,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', =
'^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', =
'^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelic=
o,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', =
'^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^h=
aoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^=
hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt=
,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperu=
n,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*=
', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hyne=
tek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*',=
 '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*',=
 '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^=
keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.=
*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.=
*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.=
*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^=
lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,=
.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.=
*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite=
,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,=
.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*=
', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi=
,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '=
^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*'=
, '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '=
^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*',=
 '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^mi=
crel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*=
', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^miliank=
e,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*',=
 '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^=
mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm=
,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mr=
vl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^=
mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^natio=
nal,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcu=
be,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^n=
etxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '=
^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,=
.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,=
.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*'=
, '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*'=
, '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^oni=
e,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.=
*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^=
openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', =
'^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxs=
emi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^p=
article,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^p=
hicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$=
', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome=
,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^pola=
roid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^p=
ov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primevi=
ew,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism=
,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.=
*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', =
'^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld=
,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*',=
 '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revoti=
cs,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic=
,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', =
'^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^=
saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sa=
ndisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schu=
lercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^=
seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensorte=
k,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sha=
rp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^=
si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^si=
flower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '=
^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silic=
onmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^=
sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov=
,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^s=
mi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.=
*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*'=
, '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsso=
n,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste=
,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^sum=
mit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^=
swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^ta=
iguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,=
.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexi=
on,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^=
teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', =
'^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*=
', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,=
.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*'=
, '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tp=
o,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyh=
x,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*'=
, '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratr=
onik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', =
'^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '=
^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.=
*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', =
'^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', =
'^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vsc=
om,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare=
,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwa=
ve,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.=
*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.=
*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfv=
ision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*',=
 '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*'=
, '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes=
-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yone=
s-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^za=
rlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*'=
, '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'me=
diatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'me=
diatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/ (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/ (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one mus=
t be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/ (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fi=
xed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/ (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0, 10737418=
24, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
opp_table0 (operating-points-v2): $nodename:0: 'opp_table0' does not match =
'^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
opp_table0 (operating-points-v2): Unevaluated properties are not allowed ('=
opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
l2-cache (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
clkitg (simple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\=
-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
soc_clksys (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z][=
a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/infracfg@10001000: failed to match any schema with compatible: =
['mediatek,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/topckgen@1001b000: failed to match any schema with compatible: =
['mediatek,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/apmixedsys@1001e000: failed to match any schema with compatible=
: ['mediatek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@10060000: failed to match any schema with compatible: ['=
mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-m=
fd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@10060000: failed to match any schema with compatible: ['=
mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-m=
fd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@10060000/pcs: failed to match any schema with compatible=
: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@10070000: failed to match any schema with compatible: ['=
mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-m=
fd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@10070000: failed to match any schema with compatible: ['=
mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-m=
fd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@10070000/pcs: failed to match any schema with compatible=
: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/mcusys@10400000: failed to match any schema with compatible: ['=
mediatek,mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@15000000: failed to match any schema with compatible: ['=
mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@15000000: failed to match any schema with compatible: ['=
mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_clksys/syscon@15000000/reset-controller: failed to match any schema wi=
th compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/reserved-memory/wmcpu-reserved@50000000: failed to match any schema with c=
ompatible: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fi=
xed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,=
hwver', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/infra_bus_prot@1000310c: failed to match any schema with compatible: [=
'mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediat=
ek,mt7987-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/boottrap@1001f6f0: failed to match any schema with compatible: ['media=
tek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not =
match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed=
, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,m=
t7987-pwm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?=
)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address=
-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-b=
its', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional fa=
iled, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/spi@11008800: failed to match any schema with compatible: ['mediatek,m=
t7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional fa=
iled, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/spi@11009800: failed to match any schema with compatible: ['mediatek,m=
t7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' doe=
s not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: 'r=
x_imp' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['in=
tr', 'auto_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [3=
0]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' doe=
s not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-names: ['in=
tr', 'rx_imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: [[31], [3=
2], [33], [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000' does no=
t match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb-phy@11c50000 (mediatek,mt7987): compatible: 'oneOf' conditional failed,=
 one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/usb-phy@11c50000: failed to match any schema with compatible: ['mediat=
ek,mt7987', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
usb@11200000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt7987-xhci' i=
s not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7=
622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986=
-xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xh=
ci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8189-xhci'=
, 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/usb@11200000: failed to match any schema with compatible: ['mediatek,m=
t7987-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names: ['aud_bus_ck'=
, 'aud_26m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel', 'aud_i2s=
_m'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13], [22, 14=
], [22, 15], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:5: 'sel' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i2s_m' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
audio-controller@11210000 (mediatek,mt7987-afe): compatible: 'oneOf' condit=
ional failed, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/audio-controller@11210000: failed to match any schema with compatible:=
 ['mediatek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mmc@11230000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi=
_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [=
22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/wed: failed to match any schema with compatible: ['mediatek,wed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,=
wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,=
wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional faile=
d, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,=
mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional faile=
d, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,=
mt7987-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/topmisc@10021000: failed to match any schema with compatible: ['mediat=
ek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/topmisc@10021000: failed to match any schema with compatible: ['mediat=
ek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
efuse@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional failed, on=
e must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/devapc@1a110000: failed to match any schema with compatible: ['mediate=
k,mt7987-devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
soc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z][=
a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
syscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-et=
hwarp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
syscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_netsys/ethernet@15100000: failed to match any schema with compatible: =
['mediatek,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_netsys/hnat@15000000: failed to match any schema with compatible: ['me=
diatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
crypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not match any =
of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
crypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is a requir=
ed property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
crypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0'=
, 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
crypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4],=
 [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7981-crypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc_netsys/crypto@15600000: failed to match any schema with compatible: ['=
inside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
mikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/mikro-bus/gpio-export@0: failed to match any schema with compatible: ['gpi=
o-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
gpio-3: 'gpio-export,name', 'gpio-export,output' do not match any of the re=
gexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-ke=
y|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc=
),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,=
.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^a=
lps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^=
amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^a=
mpire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^ande=
stech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', =
'^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^a=
rctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ari=
es,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*=
', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', =
'^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^=
atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', =
'^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,=
.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '=
^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtre=
etech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe=
,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', =
'^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byteda=
nce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^ca=
meo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catal=
yst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*',=
 '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,=
.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chr=
p,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', =
'^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^c=
nxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^co=
ngatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', =
'^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimon=
off,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongw=
oon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.=
*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', =
'^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^ed=
t,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*',=
 '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo=
,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.=
*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^en=
clustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^e=
ngicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*'=
, '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^eve=
rest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exe=
gin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^=
globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,=
.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^=
grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^hao=
yu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '=
^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hi=
silicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.=
*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,=
.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*',=
 '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynete=
k,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '=
^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^im=
agis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostarte=
c,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^i=
ngenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', =
'^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercont=
rol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^=
irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',=
 '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*=
', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '=
^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^ke=
ithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*'=
, '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*'=
, '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*'=
, '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lc=
tech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*=
', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*'=
, '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.=
*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*=
', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*',=
 '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.=
*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^l=
xa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard=
,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxline=
ar,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', =
'^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^m=
elexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '=
^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micr=
el,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*',=
 '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,=
.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '=
^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mo=
bileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.=
*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl=
,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mu=
ndoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nationa=
l,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube=
,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^net=
xeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^n=
extthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*=
', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*=
', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', =
'^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', =
'^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,=
.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*'=
, '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^op=
enwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^=
osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsem=
i,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^par=
ticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phi=
comm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$',=
 '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.=
*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaro=
id,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov=
,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview=
,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.=
*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*'=
, '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^=
raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.=
*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '=
^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics=
,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.=
*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^=
ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sa=
ef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sand=
isk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schule=
rcontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^se=
irobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,=
.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp=
,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si=
-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sifl=
ower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^s=
ilead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silicon=
mitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
nowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.=
*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi=
,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*'=
, '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', =
'^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*'=
, '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,=
.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.=
*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summi=
t,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^sw=
ir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taig=
uanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.=
*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,=
.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', =
'^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratron=
ik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^=
usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^v=
ariscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*'=
, '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^=
virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^=
vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom=
,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.=
*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave=
,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*'=
, '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*'=
, '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvis=
ion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '=
^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', =
'^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-o=
ptoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-=
toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarl=
ink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', =
'^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
gpio-4: 'gpio-export,name', 'gpio-export,output' do not match any of the re=
gexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-ke=
y|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc=
),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,=
.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^a=
lps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^=
amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^a=
mpire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^ande=
stech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', =
'^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^a=
rctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ari=
es,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*=
', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', =
'^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^=
atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', =
'^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,=
.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '=
^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtre=
etech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe=
,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', =
'^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byteda=
nce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^ca=
meo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catal=
yst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*',=
 '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,=
.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chr=
p,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', =
'^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^c=
nxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^co=
ngatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', =
'^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimon=
off,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongw=
oon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.=
*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', =
'^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^ed=
t,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*',=
 '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo=
,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.=
*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^en=
clustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^e=
ngicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*'=
, '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^eve=
rest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exe=
gin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^=
globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,=
.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^=
grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^hao=
yu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '=
^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hi=
silicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.=
*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,=
.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*',=
 '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynete=
k,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '=
^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^im=
agis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostarte=
c,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^i=
ngenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', =
'^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercont=
rol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^=
irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',=
 '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*=
', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '=
^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^ke=
ithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*'=
, '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*'=
, '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*'=
, '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lc=
tech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*=
', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*'=
, '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.=
*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*=
', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*',=
 '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.=
*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^l=
xa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard=
,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxline=
ar,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', =
'^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^m=
elexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '=
^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micr=
el,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*',=
 '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,=
.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '=
^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mo=
bileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.=
*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl=
,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mu=
ndoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nationa=
l,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube=
,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^net=
xeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^n=
extthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*=
', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*=
', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', =
'^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', =
'^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,=
.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*'=
, '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^op=
enwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^=
osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsem=
i,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^par=
ticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phi=
comm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$',=
 '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.=
*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaro=
id,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov=
,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview=
,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.=
*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*'=
, '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^=
raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.=
*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '=
^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics=
,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.=
*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^=
ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sa=
ef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sand=
isk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schule=
rcontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^se=
irobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,=
.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp=
,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si=
-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sifl=
ower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^s=
ilead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silicon=
mitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
nowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.=
*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi=
,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*'=
, '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', =
'^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*'=
, '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,=
.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.=
*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summi=
t,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^sw=
ir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taig=
uanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.=
*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,=
.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', =
'^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratron=
ik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^=
usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^v=
ariscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*'=
, '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^=
virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^=
vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom=
,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.=
*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave=
,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*'=
, '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*'=
, '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvis=
ion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '=
^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', =
'^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-o=
ptoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-=
toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarl=
ink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', =
'^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
gpio-5: 'gpio-export,name', 'gpio-export,output' do not match any of the re=
gexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-ke=
y|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc=
),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,=
.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^a=
lps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^=
amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^a=
mpire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^ande=
stech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', =
'^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^a=
rctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ari=
es,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*=
', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', =
'^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^=
atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', =
'^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,=
.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '=
^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtre=
etech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe=
,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', =
'^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byteda=
nce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^ca=
meo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catal=
yst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*',=
 '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,=
.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chr=
p,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', =
'^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^c=
nxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^co=
ngatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', =
'^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimon=
off,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongw=
oon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.=
*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', =
'^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^ed=
t,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*',=
 '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo=
,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.=
*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^en=
clustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^e=
ngicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*'=
, '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^eve=
rest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exe=
gin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^=
globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,=
.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^=
grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^hao=
yu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '=
^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hi=
silicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.=
*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,=
.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*',=
 '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynete=
k,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '=
^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^im=
agis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostarte=
c,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^i=
ngenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', =
'^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercont=
rol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^=
irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',=
 '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*=
', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '=
^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^ke=
ithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*'=
, '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*'=
, '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*'=
, '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lc=
tech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*=
', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*'=
, '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.=
*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*=
', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*',=
 '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.=
*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^l=
xa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard=
,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxline=
ar,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', =
'^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^m=
elexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '=
^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micr=
el,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*',=
 '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,=
.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '=
^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mo=
bileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.=
*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl=
,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mu=
ndoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nationa=
l,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube=
,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^net=
xeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^n=
extthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*=
', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*=
', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', =
'^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', =
'^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,=
.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*'=
, '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^op=
enwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^=
osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsem=
i,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^par=
ticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phi=
comm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$',=
 '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.=
*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaro=
id,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov=
,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview=
,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.=
*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*'=
, '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^=
raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.=
*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '=
^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics=
,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.=
*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^=
ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sa=
ef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sand=
isk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schule=
rcontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^se=
irobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,=
.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp=
,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si=
-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sifl=
ower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^s=
ilead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silicon=
mitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
nowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.=
*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi=
,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*'=
, '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', =
'^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*'=
, '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,=
.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.=
*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summi=
t,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^sw=
ir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taig=
uanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.=
*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,=
.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', =
'^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratron=
ik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^=
usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^v=
ariscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*'=
, '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^=
virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^=
vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom=
,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.=
*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave=
,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*'=
, '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*'=
, '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvis=
ion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '=
^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', =
'^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-o=
ptoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-=
toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarl=
ink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', =
'^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
gpio-6: 'gpio-export,name', 'gpio-export,output' do not match any of the re=
gexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-ke=
y|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc=
),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,=
.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^a=
lps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^=
amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^a=
mpire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^ande=
stech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', =
'^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^a=
rctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ari=
es,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*=
', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', =
'^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^=
atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', =
'^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,=
.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '=
^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtre=
etech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe=
,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', =
'^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byteda=
nce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^ca=
meo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catal=
yst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*',=
 '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,=
.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chr=
p,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', =
'^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^c=
nxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^co=
ngatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', =
'^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimon=
off,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongw=
oon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.=
*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', =
'^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^ed=
t,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*',=
 '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo=
,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.=
*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^en=
clustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^e=
ngicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*'=
, '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^eve=
rest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exe=
gin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^=
globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,=
.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^=
grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^hao=
yu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '=
^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hi=
silicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.=
*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,=
.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*',=
 '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynete=
k,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '=
^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^im=
agis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostarte=
c,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^i=
ngenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', =
'^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercont=
rol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^=
irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',=
 '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*=
', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '=
^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^ke=
ithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*'=
, '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*'=
, '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*'=
, '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lc=
tech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*=
', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*'=
, '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.=
*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*=
', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*',=
 '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.=
*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^l=
xa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard=
,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxline=
ar,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', =
'^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^m=
elexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '=
^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micr=
el,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*',=
 '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,=
.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '=
^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mo=
bileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.=
*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl=
,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mu=
ndoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nationa=
l,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube=
,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^net=
xeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^n=
extthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*=
', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*=
', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', =
'^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', =
'^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,=
.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*'=
, '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^op=
enwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^=
osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsem=
i,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^par=
ticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phi=
comm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$',=
 '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.=
*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaro=
id,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov=
,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview=
,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.=
*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*'=
, '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^=
raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.=
*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '=
^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics=
,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.=
*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^=
ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sa=
ef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sand=
isk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schule=
rcontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^se=
irobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,=
.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp=
,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si=
-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sifl=
ower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^s=
ilead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silicon=
mitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
nowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.=
*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi=
,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*'=
, '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', =
'^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*'=
, '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,=
.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.=
*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summi=
t,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^sw=
ir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taig=
uanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.=
*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,=
.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', =
'^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratron=
ik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^=
usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^v=
ariscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*'=
, '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^=
virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^=
vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom=
,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.=
*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave=
,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*'=
, '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*'=
, '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvis=
ion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '=
^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', =
'^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-o=
ptoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-=
toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarl=
ink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', =
'^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/mikro-bus/gpio-export@1: failed to match any schema with compatible: ['gpi=
o-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
gpio-46: 'gpio-export,name', 'gpio-export,output' do not match any of the r=
egexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-k=
ey|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpm=
c),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|p=
xa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|s=
t-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '=
^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-=
9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^ab=
b,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '=
^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netw=
ork,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis=
,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^=
alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '=
^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^=
ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^and=
estech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ar=
ies,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.=
*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*',=
 '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '=
^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*',=
 '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis=
,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', =
'^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtr=
eetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^bo=
e,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',=
 '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byted=
ance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^c=
ameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cata=
lyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*'=
, '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea=
,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^ch=
rp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*',=
 '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^=
cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^c=
ongatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', =
'^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*=
', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^=
cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*'=
, '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell=
,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*',=
 '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimo=
noff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*'=
, '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dong=
woon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,=
.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*',=
 '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^e=
dt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*'=
, '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elim=
o,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,=
.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^e=
nclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^=
engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*=
', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fa=
irphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fe=
ixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipk=
art,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^f=
reebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuj=
itsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^=
gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,=
.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '=
^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '=
^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico=
,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '=
^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^ha=
oyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', =
'^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^h=
isilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynet=
ek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', =
'^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^i=
magis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostart=
ec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^=
ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*',=
 '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercon=
trol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '=
^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*'=
, '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.=
*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', =
'^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^k=
eithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*=
', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*=
', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*=
', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^l=
ctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.=
*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*=
', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,=
.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.=
*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*'=
, '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,=
.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^=
lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboar=
d,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlin=
ear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*',=
 '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^=
melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', =
'^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^mic=
rel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*'=
, '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke=
,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', =
'^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^m=
obileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,=
.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrv=
l,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*',=
 '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*',=
 '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pa=
rticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^ph=
icomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$'=
, '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,=
.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polar=
oid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^po=
v,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primevie=
w,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,=
.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*=
', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '=
^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,=
.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', =
'^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotic=
s,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,=
.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '=
^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^s=
aef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^san=
disk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schul=
ercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^s=
eirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek=
,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^shar=
p,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^s=
i-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sif=
lower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^=
silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silico=
nmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^s=
inowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,=
.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^sm=
i,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*=
', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*',=
 '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*=
', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson=
,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,=
.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summ=
it,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^s=
wir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^tai=
guanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*=
', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '=
^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '=
^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vsco=
m,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,=
.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwav=
e,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*=
', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*=
', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvi=
sion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', =
'^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*',=
 '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-=
optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones=
-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zar=
link,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*',=
 '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'med=
iatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'med=
iatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
 (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
 (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must=
 be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
 (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fix=
ed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
 (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0, 107374182=
4, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: o=
pp_table0 (operating-points-v2): $nodename:0: 'opp_table0' does not match '=
^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: o=
pp_table0 (operating-points-v2): Unevaluated properties are not allowed ('o=
pp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: l=
2-cache (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: c=
lkitg (simple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
oc_clksys (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z][a=
-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/infracfg@10001000: failed to match any schema with compatible: [=
'mediatek,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/topckgen@1001b000: failed to match any schema with compatible: [=
'mediatek,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/apmixedsys@1001e000: failed to match any schema with compatible:=
 ['mediatek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@10060000: failed to match any schema with compatible: ['m=
ediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mf=
d']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@10060000: failed to match any schema with compatible: ['m=
ediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mf=
d']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@10060000/pcs: failed to match any schema with compatible:=
 ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@10070000: failed to match any schema with compatible: ['m=
ediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mf=
d']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@10070000: failed to match any schema with compatible: ['m=
ediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mf=
d']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@10070000/pcs: failed to match any schema with compatible:=
 ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/mcusys@10400000: failed to match any schema with compatible: ['m=
ediatek,mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@15000000: failed to match any schema with compatible: ['m=
ediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@15000000: failed to match any schema with compatible: ['m=
ediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_clksys/syscon@15000000/reset-controller: failed to match any schema wit=
h compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
wm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
reserved-memory/wmcpu-reserved@50000000: failed to match any schema with co=
mpatible: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
oc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
oc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fix=
ed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,h=
wver', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['=
mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediate=
k,mt7987-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediat=
ek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: t=
rng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: t=
rng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: t=
rng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: t=
rng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not m=
atch '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: t=
rng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed,=
 one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt=
7987-pwm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
ca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)=
?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
ca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-=
cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: e=
eprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bi=
ts', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
pi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional fai=
led, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
pi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
pi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required prope=
rty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt=
7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
pi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional fai=
led, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/spi@11009800: failed to match any schema with compatible: ['mediatek,mt=
7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' does=
 not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: 'rx=
_imp' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['int=
r', 'auto_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [30=
]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' does=
 not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-names: ['int=
r', 'rx_imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: [[31], [32=
], [33], [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000' does not=
 match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb-phy@11c50000 (mediatek,mt7987): compatible: 'oneOf' conditional failed, =
one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/usb-phy@11c50000: failed to match any schema with compatible: ['mediate=
k,mt7987', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: u=
sb@11200000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt7987-xhci' is=
 not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt76=
22-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-=
xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhc=
i', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8189-xhci',=
 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt=
7987-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names: ['aud_bus_ck',=
 'aud_26m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel', 'aud_i2s_=
m'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13], [22, 14]=
, [22, 15], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was=
 expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:5: 'sel' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i2s_m' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: a=
udio-controller@11210000 (mediatek,mt7987-afe): compatible: 'oneOf' conditi=
onal failed, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/audio-controller@11210000: failed to match any schema with compatible: =
['mediatek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
mc@11230000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
mc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
mc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
mc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
mc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_=
cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
mc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [2=
2, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/wed: failed to match any schema with compatible: ['mediatek,wed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,w=
ed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,w=
ed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
cie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed=
, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,m=
t7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
cie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed=
, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,m=
t7987-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/topmisc@10021000: failed to match any schema with compatible: ['mediate=
k,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/topmisc@10021000: failed to match any schema with compatible: ['mediate=
k,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: e=
fuse@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional failed, one=
 must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/devapc@1a110000: failed to match any schema with compatible: ['mediatek=
,mt7987-devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
oc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z][a=
-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
yscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-eth=
warp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: s=
yscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_netsys/ethernet@15100000: failed to match any schema with compatible: [=
'mediatek,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_netsys/hnat@15000000: failed to match any schema with compatible: ['med=
iatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: c=
rypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: c=
rypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is a require=
d property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: c=
rypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0',=
 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: c=
rypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4], =
[0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: c=
rypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' condit=
ional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7981-crypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc_netsys/crypto@15600000: failed to match any schema with compatible: ['i=
nside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
ikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: m=
ikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
mikro-bus/gpio-export@0: failed to match any schema with compatible: ['gpio=
-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: g=
pio-3: 'gpio-export,name', 'gpio-export,output' do not match any of the reg=
exes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key=
|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc)=
,.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa=
-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-=
plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9=
tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#=
_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,=
.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^=
acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^=
ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*=
', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^a=
esop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-networ=
k,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.=
*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^al=
ps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^a=
md,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^am=
pire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andes=
tech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '=
^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^ar=
ctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^arie=
s,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*'=
, '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '=
^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^a=
tlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '=
^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.=
*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^=
beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtree=
tech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,=
.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '=
^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedan=
ce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cam=
eo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cataly=
st,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', =
'^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.=
*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp=
,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '=
^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cn=
xt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^con=
gatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^=
cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*',=
 '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cu=
bietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', =
'^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.=
*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '=
^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimono=
ff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwo=
on,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*=
', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '=
^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt=
,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', =
'^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,=
.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*=
', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enc=
lustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^en=
gicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*',=
 '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ever=
est,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exeg=
in,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fair=
phone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feix=
in,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^g=
lobalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.=
*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^g=
rmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoy=
u,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^=
hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^his=
ilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*=
', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.=
*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', =
'^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek=
,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^=
icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec=
,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^in=
genic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '=
^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontr=
ol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^i=
rondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', =
'^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*'=
, '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^=
jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^kei=
thkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*',=
 '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*',=
 '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*',=
 '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lct=
ech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*=
', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*=
', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lx=
a,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,=
.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinea=
r,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^me=
lexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^=
menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micre=
l,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', =
'^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mun=
doreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national=
,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,=
.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netx=
eon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^ne=
xtthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*'=
, '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*'=
, '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '=
^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '=
^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.=
*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*',=
 '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^ope=
nwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^o=
sddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi=
,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^part=
icle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phic=
omm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', =
'^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*=
', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroi=
d,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,=
.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,=
.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*=
', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*',=
 '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^r=
aidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*=
', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^=
remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,=
.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*=
', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^r=
onbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sae=
f,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandi=
sk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schuler=
control,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^sei=
robotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.=
*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,=
.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-=
en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflo=
wer,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^si=
lead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconm=
itus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sin=
owealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*=
', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,=
.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*',=
 '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '=
^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*',=
 '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.=
*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*=
', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit=
,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swi=
r,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigu=
anck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^tel=
tonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.=
*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '=
^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratroni=
k,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^u=
sr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^va=
riscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*',=
 '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^v=
irtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^v=
ivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,=
.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*=
', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,=
.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*',=
 '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*',=
 '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisi=
on,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^=
xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '=
^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-op=
toelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-t=
optech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarli=
nk,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '=
^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: g=
pio-4: 'gpio-export,name', 'gpio-export,output' do not match any of the reg=
exes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key=
|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc)=
,.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa=
-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-=
plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9=
tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#=
_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,=
.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^=
acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^=
ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*=
', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^a=
esop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-networ=
k,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.=
*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^al=
ps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^a=
md,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^am=
pire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andes=
tech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '=
^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^ar=
ctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^arie=
s,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*'=
, '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '=
^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^a=
tlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '=
^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.=
*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^=
beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtree=
tech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,=
.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '=
^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedan=
ce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cam=
eo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cataly=
st,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', =
'^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.=
*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp=
,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '=
^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cn=
xt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^con=
gatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^=
cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*',=
 '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cu=
bietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', =
'^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.=
*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '=
^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimono=
ff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwo=
on,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*=
', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '=
^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt=
,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', =
'^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,=
.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*=
', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enc=
lustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^en=
gicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*',=
 '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ever=
est,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exeg=
in,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fair=
phone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feix=
in,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^g=
lobalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.=
*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^g=
rmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoy=
u,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^=
hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^his=
ilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*=
', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.=
*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', =
'^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek=
,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^=
icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec=
,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^in=
genic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '=
^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontr=
ol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^i=
rondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', =
'^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*'=
, '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^=
jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^kei=
thkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*',=
 '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*',=
 '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*',=
 '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lct=
ech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*=
', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*=
', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lx=
a,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,=
.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinea=
r,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^me=
lexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^=
menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micre=
l,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', =
'^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mun=
doreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national=
,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,=
.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netx=
eon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^ne=
xtthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*'=
, '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*'=
, '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '=
^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '=
^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.=
*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*',=
 '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^ope=
nwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^o=
sddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi=
,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^part=
icle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phic=
omm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', =
'^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*=
', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroi=
d,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,=
.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,=
.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*=
', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*',=
 '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^r=
aidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*=
', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^=
remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,=
.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*=
', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^r=
onbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sae=
f,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandi=
sk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schuler=
control,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^sei=
robotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.=
*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,=
.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-=
en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflo=
wer,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^si=
lead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconm=
itus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sin=
owealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*=
', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,=
.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*',=
 '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '=
^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*',=
 '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.=
*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*=
', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit=
,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swi=
r,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigu=
anck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^tel=
tonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.=
*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '=
^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratroni=
k,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^u=
sr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^va=
riscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*',=
 '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^v=
irtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^v=
ivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,=
.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*=
', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,=
.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*',=
 '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*',=
 '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisi=
on,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^=
xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '=
^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-op=
toelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-t=
optech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarli=
nk,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '=
^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: g=
pio-5: 'gpio-export,name', 'gpio-export,output' do not match any of the reg=
exes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key=
|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc)=
,.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa=
-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-=
plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9=
tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#=
_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,=
.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^=
acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^=
ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*=
', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^a=
esop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-networ=
k,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.=
*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^al=
ps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^a=
md,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^am=
pire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andes=
tech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '=
^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^ar=
ctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^arie=
s,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*'=
, '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '=
^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^a=
tlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '=
^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.=
*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^=
beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtree=
tech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,=
.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '=
^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedan=
ce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cam=
eo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cataly=
st,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', =
'^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.=
*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp=
,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '=
^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cn=
xt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^con=
gatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^=
cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*',=
 '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cu=
bietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', =
'^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.=
*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '=
^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimono=
ff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwo=
on,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*=
', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '=
^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt=
,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', =
'^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,=
.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*=
', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enc=
lustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^en=
gicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*',=
 '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ever=
est,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exeg=
in,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fair=
phone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feix=
in,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^g=
lobalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.=
*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^g=
rmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoy=
u,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^=
hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^his=
ilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*=
', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.=
*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', =
'^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek=
,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^=
icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec=
,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^in=
genic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '=
^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontr=
ol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^i=
rondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', =
'^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*'=
, '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^=
jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^kei=
thkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*',=
 '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*',=
 '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*',=
 '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lct=
ech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*=
', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*=
', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lx=
a,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,=
.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinea=
r,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^me=
lexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^=
menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micre=
l,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', =
'^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mun=
doreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national=
,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,=
.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netx=
eon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^ne=
xtthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*'=
, '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*'=
, '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '=
^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '=
^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.=
*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*',=
 '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^ope=
nwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^o=
sddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi=
,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^part=
icle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phic=
omm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', =
'^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*=
', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroi=
d,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,=
.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,=
.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*=
', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*',=
 '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^r=
aidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*=
', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^=
remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,=
.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*=
', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^r=
onbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sae=
f,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandi=
sk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schuler=
control,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^sei=
robotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.=
*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,=
.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-=
en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflo=
wer,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^si=
lead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconm=
itus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sin=
owealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*=
', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,=
.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*',=
 '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '=
^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*',=
 '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.=
*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*=
', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit=
,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swi=
r,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigu=
anck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^tel=
tonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.=
*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '=
^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratroni=
k,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^u=
sr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^va=
riscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*',=
 '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^v=
irtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^v=
ivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,=
.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*=
', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,=
.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*',=
 '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*',=
 '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisi=
on,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^=
xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '=
^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-op=
toelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-t=
optech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarli=
nk,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '=
^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: g=
pio-6: 'gpio-export,name', 'gpio-export,output' do not match any of the reg=
exes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key=
|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc)=
,.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa=
-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-=
plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9=
tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#=
_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,=
.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^=
acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^=
ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*=
', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^a=
esop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-networ=
k,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.=
*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^al=
ps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^a=
md,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^am=
pire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andes=
tech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '=
^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^ar=
ctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^arie=
s,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*'=
, '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '=
^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^a=
tlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '=
^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.=
*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^=
beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtree=
tech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,=
.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '=
^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedan=
ce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cam=
eo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cataly=
st,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', =
'^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.=
*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp=
,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '=
^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cn=
xt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^con=
gatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^=
cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*',=
 '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cu=
bietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', =
'^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.=
*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '=
^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimono=
ff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwo=
on,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*=
', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '=
^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt=
,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', =
'^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,=
.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*=
', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enc=
lustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^en=
gicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*',=
 '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ever=
est,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exeg=
in,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fair=
phone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feix=
in,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^g=
lobalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.=
*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^g=
rmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoy=
u,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^=
hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^his=
ilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*=
', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.=
*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', =
'^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek=
,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^=
icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec=
,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^in=
genic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '=
^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontr=
ol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^i=
rondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', =
'^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*'=
, '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^=
jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^kei=
thkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*',=
 '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*',=
 '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*',=
 '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lct=
ech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*=
', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*=
', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lx=
a,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,=
.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinea=
r,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^me=
lexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^=
menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micre=
l,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', =
'^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mun=
doreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national=
,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,=
.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netx=
eon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^ne=
xtthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*'=
, '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*'=
, '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '=
^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '=
^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.=
*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*',=
 '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^ope=
nwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^o=
sddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi=
,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^part=
icle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phic=
omm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', =
'^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*=
', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroi=
d,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,=
.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,=
.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*=
', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*',=
 '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^r=
aidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*=
', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^=
remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,=
.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*=
', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^r=
onbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sae=
f,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandi=
sk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schuler=
control,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^sei=
robotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.=
*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,=
.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-=
en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflo=
wer,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^si=
lead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconm=
itus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sin=
owealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*=
', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,=
.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*',=
 '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '=
^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*',=
 '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.=
*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*=
', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit=
,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swi=
r,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigu=
anck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^tel=
tonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.=
*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '=
^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratroni=
k,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^u=
sr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^va=
riscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*',=
 '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^v=
irtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^v=
ivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,=
.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*=
', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,=
.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*',=
 '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*',=
 '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisi=
on,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^=
xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '=
^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-op=
toelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-t=
optech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarli=
nk,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '=
^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
mikro-bus/gpio-export@1: failed to match any schema with compatible: ['gpio=
-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: g=
pio-46: 'gpio-export,name', 'gpio-export,output' do not match any of the re=
gexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-ke=
y|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc=
),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,=
.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^a=
lps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^=
amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^a=
mpire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^ande=
stech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', =
'^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^a=
rctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^ari=
es,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*=
', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', =
'^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^=
atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', =
'^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,=
.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '=
^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtre=
etech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe=
,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', =
'^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^byteda=
nce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^ca=
meo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catal=
yst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*',=
 '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,=
.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chr=
p,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', =
'^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^c=
nxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^co=
ngatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', =
'^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimon=
off,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongw=
oon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.=
*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', =
'^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^ed=
t,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*',=
 '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo=
,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.=
*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^en=
clustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^e=
ngicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*'=
, '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^eve=
rest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exe=
gin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^=
globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,=
.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^=
grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^hao=
yu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '=
^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hi=
silicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.=
*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,=
.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*',=
 '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynete=
k,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '=
^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^im=
agis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostarte=
c,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^i=
ngenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', =
'^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercont=
rol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^=
irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',=
 '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*=
', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '=
^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^ke=
ithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*'=
, '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*'=
, '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*'=
, '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lc=
tech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*=
', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*'=
, '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.=
*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*=
', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*',=
 '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.=
*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^l=
xa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard=
,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxline=
ar,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', =
'^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^m=
elexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '=
^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micr=
el,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*',=
 '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,=
.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '=
^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mo=
bileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.=
*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl=
,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mu=
ndoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nationa=
l,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube=
,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^net=
xeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^n=
extthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*=
', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*=
', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', =
'^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', =
'^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,=
.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*'=
, '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^op=
enwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^=
osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsem=
i,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^par=
ticle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phi=
comm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$',=
 '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.=
*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaro=
id,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov=
,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview=
,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.=
*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*'=
, '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^=
raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.=
*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '=
^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics=
,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.=
*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^=
ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sa=
ef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sand=
isk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schule=
rcontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^se=
irobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,=
.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp=
,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si=
-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^sifl=
ower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^s=
ilead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silicon=
mitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
nowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.=
*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi=
,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*'=
, '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', =
'^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*'=
, '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,=
.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.=
*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summi=
t,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^sw=
ir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taig=
uanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.=
*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,=
.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', =
'^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratron=
ik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^=
usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^v=
ariscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*'=
, '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^=
virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^=
vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom=
,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.=
*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave=
,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*'=
, '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*'=
, '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvis=
ion,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '=
^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', =
'^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-o=
ptoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-=
toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarl=
ink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', =
'^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /:=
 failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'medi=
atek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /:=
 failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'medi=
atek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / =
(bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / =
(bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must =
be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / =
(bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixe=
d:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / =
(bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0, 1073741824=
, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: op=
p_table0 (operating-points-v2): $nodename:0: 'opp_table0' does not match '^=
opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: op=
p_table0 (operating-points-v2): Unevaluated properties are not allowed ('op=
p-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: l2=
-cache (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: cl=
kitg (simple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]=
+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: so=
c_clksys (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z][a-=
z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/infracfg@10001000: failed to match any schema with compatible: ['=
mediatek,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/topckgen@1001b000: failed to match any schema with compatible: ['=
mediatek,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/apmixedsys@1001e000: failed to match any schema with compatible: =
['mediatek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@10060000: failed to match any schema with compatible: ['me=
diatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mfd=
']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@10060000: failed to match any schema with compatible: ['me=
diatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mfd=
']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@10060000/pcs: failed to match any schema with compatible: =
['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@10070000: failed to match any schema with compatible: ['me=
diatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mfd=
']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@10070000: failed to match any schema with compatible: ['me=
diatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mfd=
']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@10070000/pcs: failed to match any schema with compatible: =
['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/mcusys@10400000: failed to match any schema with compatible: ['me=
diatek,mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@15000000: failed to match any schema with compatible: ['me=
diatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@15000000: failed to match any schema with compatible: ['me=
diatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_clksys/syscon@15000000/reset-controller: failed to match any schema with=
 compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pw=
m-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /r=
eserved-memory/wmcpu-reserved@50000000: failed to match any schema with com=
patible: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: so=
c (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: so=
c (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixe=
d:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hw=
ver', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['m=
ediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek=
,mt7987-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediate=
k,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: tr=
ng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: tr=
ng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: tr=
ng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: tr=
ng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not ma=
tch '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: tr=
ng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, =
one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7=
987-pwm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pc=
a9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?=
mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pc=
a9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-c=
ells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: ee=
prom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bit=
s', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: sp=
i@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: sp=
i@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: sp=
i@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7=
987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: sp=
i@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/spi@11009800: failed to match any schema with compatible: ['mediatek,mt7=
987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' does =
not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: 'rx_=
imp' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['intr=
', 'auto_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [30]=
] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' does =
not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-names: ['intr=
', 'rx_imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: [[31], [32]=
, [33], [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000' does not =
match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b-phy@11c50000 (mediatek,mt7987): compatible: 'oneOf' conditional failed, o=
ne must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/usb-phy@11c50000: failed to match any schema with compatible: ['mediatek=
,mt7987', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: us=
b@11200000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt7987-xhci' is =
not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt762=
2-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-x=
hci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci=
', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8189-xhci', =
'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt7=
987-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names: ['aud_bus_ck', =
'aud_26m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel', 'aud_i2s_m=
'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13], [22, 14],=
 [22, 15], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:5: 'sel' was exp=
ected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i2s_m' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: au=
dio-controller@11210000 (mediatek,mt7987-afe): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/audio-controller@11210000: failed to match any schema with compatible: [=
'mediatek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mm=
c@11230000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mm=
c@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mm=
c@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mm=
c@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mm=
c@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_c=
g', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mm=
c@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22=
, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/wed: failed to match any schema with compatible: ['mediatek,wed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/wed0@15010000: failed to match any schema with compatible: ['mediatek,we=
d0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/wdma@15104800: failed to match any schema with compatible: ['mediatek,we=
d-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pc=
ie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed,=
 one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt=
7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pc=
ie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed,=
 one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt=
7987-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/topmisc@10021000: failed to match any schema with compatible: ['mediatek=
,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/topmisc@10021000: failed to match any schema with compatible: ['mediatek=
,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: ef=
use@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional failed, one =
must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/devapc@1a110000: failed to match any schema with compatible: ['mediatek,=
mt7987-devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: so=
c_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z][a-=
z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: sy=
scon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-ethw=
arp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: sy=
scon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required prope=
rty
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_netsys/ethernet@15100000: failed to match any schema with compatible: ['=
mediatek,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_netsys/hnat@15000000: failed to match any schema with compatible: ['medi=
atek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: cr=
ypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not match any of=
 the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: cr=
ypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is a required=
 property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: cr=
ypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0', =
'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: cr=
ypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4], [=
0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: cr=
ypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' conditi=
onal failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7981-crypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc_netsys/crypto@15600000: failed to match any schema with compatible: ['in=
side-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mi=
kro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mi=
kro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /m=
ikro-bus/gpio-export@0: failed to match any schema with compatible: ['gpio-=
export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: gp=
io-3: 'gpio-export,name', 'gpio-export,output' do not match any of the rege=
xes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|=
gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),=
.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-=
mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-p=
lgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9t=
ripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*=
', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alp=
s,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^am=
d,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^amp=
ire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andest=
ech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^=
apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arc=
tic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries=
,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*',=
 '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^b=
eacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreet=
ech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.=
*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^=
bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedanc=
e,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^came=
o,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalys=
t,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '=
^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*=
', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,=
.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^=
cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnx=
t,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^cong=
atec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^c=
ortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', =
'^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cub=
ietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '=
^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*=
', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^=
dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonof=
f,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '=
^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoo=
n,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*'=
, '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^=
ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,=
.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '=
^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.=
*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*'=
, '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^encl=
ustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^eng=
icam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', =
'^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^evere=
st,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegi=
n,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairp=
hone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixi=
n,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart=
,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^gl=
obalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*=
', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^gr=
mn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu=
,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^h=
ideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisi=
licon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*'=
, '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*=
', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '=
^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,=
.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^i=
cplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imag=
is,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,=
.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ing=
enic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^=
inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontro=
l,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ir=
ondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '=
^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*',=
 '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^j=
ide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keit=
hkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', =
'^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', =
'^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', =
'^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lcte=
ch,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*',=
 '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', =
'^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*'=
, '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*',=
 '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '=
^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*'=
, '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa=
,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.=
*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear=
,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^=
mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^mel=
exis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^m=
enlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel=
,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '=
^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*=
', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^m=
itsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobi=
leye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*'=
, '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.=
*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mund=
oreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,=
.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.=
*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxe=
on,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nex=
tthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*',=
 '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*',=
 '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*=
', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', =
'^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^open=
wrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^os=
ddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,=
.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^parti=
cle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phico=
mm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '=
^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*'=
, '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid=
,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.=
*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.=
*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*'=
, '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', =
'^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^ra=
idsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*'=
, '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^r=
emarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.=
*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*'=
, '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ro=
nbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef=
,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulerc=
ontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seir=
obotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*=
', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.=
*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-e=
n,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflow=
er,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^sil=
ead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmi=
tus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sino=
wealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*'=
, '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.=
*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', =
'^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^=
spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', =
'^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*=
', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*'=
, '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,=
.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir=
,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigua=
nck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*',=
 '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.=
*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^telt=
onika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^te=
sla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '=
^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*',=
 '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^=
toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*=
', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*'=
, '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*=
', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^=
ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik=
,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^us=
r,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^var=
iscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', =
'^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^vi=
rtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vi=
vax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.=
*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*'=
, '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.=
*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', =
'^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', =
'^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisio=
n,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^x=
illybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^=
xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opt=
oelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-to=
ptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlin=
k,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^=
zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: gp=
io-4: 'gpio-export,name', 'gpio-export,output' do not match any of the rege=
xes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|=
gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),=
.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-=
mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-p=
lgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9t=
ripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*=
', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alp=
s,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^am=
d,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^amp=
ire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andest=
ech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^=
apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arc=
tic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries=
,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*',=
 '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^b=
eacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreet=
ech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.=
*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^=
bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedanc=
e,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^came=
o,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalys=
t,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '=
^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*=
', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,=
.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^=
cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnx=
t,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^cong=
atec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^c=
ortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', =
'^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cub=
ietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '=
^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*=
', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^=
dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonof=
f,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '=
^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoo=
n,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*'=
, '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^=
ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,=
.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '=
^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.=
*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*'=
, '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^encl=
ustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^eng=
icam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', =
'^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^evere=
st,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegi=
n,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairp=
hone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixi=
n,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart=
,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^gl=
obalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*=
', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^gr=
mn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu=
,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^h=
ideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisi=
licon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*'=
, '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*=
', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '=
^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,=
.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^i=
cplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imag=
is,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,=
.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ing=
enic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^=
inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontro=
l,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ir=
ondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '=
^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*',=
 '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^j=
ide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keit=
hkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', =
'^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', =
'^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', =
'^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lcte=
ch,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*',=
 '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', =
'^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*'=
, '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*',=
 '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '=
^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*'=
, '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa=
,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.=
*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear=
,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^=
mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^mel=
exis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^m=
enlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel=
,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '=
^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*=
', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^m=
itsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobi=
leye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*'=
, '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.=
*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mund=
oreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,=
.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.=
*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxe=
on,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nex=
tthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*',=
 '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*',=
 '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*=
', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', =
'^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^open=
wrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^os=
ddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,=
.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^parti=
cle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phico=
mm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '=
^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*'=
, '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid=
,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.=
*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.=
*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*'=
, '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', =
'^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^ra=
idsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*'=
, '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^r=
emarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.=
*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*'=
, '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ro=
nbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef=
,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulerc=
ontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seir=
obotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*=
', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.=
*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-e=
n,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflow=
er,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^sil=
ead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmi=
tus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sino=
wealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*'=
, '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.=
*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', =
'^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^=
spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', =
'^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*=
', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*'=
, '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,=
.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir=
,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigua=
nck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*',=
 '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.=
*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^telt=
onika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^te=
sla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '=
^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*',=
 '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^=
toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*=
', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*'=
, '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*=
', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^=
ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik=
,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^us=
r,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^var=
iscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', =
'^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^vi=
rtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vi=
vax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.=
*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*'=
, '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.=
*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', =
'^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', =
'^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisio=
n,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^x=
illybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^=
xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opt=
oelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-to=
ptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlin=
k,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^=
zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: gp=
io-5: 'gpio-export,name', 'gpio-export,output' do not match any of the rege=
xes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|=
gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),=
.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-=
mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-p=
lgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9t=
ripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*=
', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alp=
s,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^am=
d,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^amp=
ire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andest=
ech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^=
apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arc=
tic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries=
,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*',=
 '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^b=
eacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreet=
ech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.=
*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^=
bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedanc=
e,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^came=
o,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalys=
t,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '=
^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*=
', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,=
.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^=
cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnx=
t,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^cong=
atec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^c=
ortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', =
'^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cub=
ietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '=
^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*=
', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^=
dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonof=
f,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '=
^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoo=
n,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*'=
, '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^=
ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,=
.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '=
^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.=
*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*'=
, '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^encl=
ustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^eng=
icam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', =
'^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^evere=
st,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegi=
n,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairp=
hone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixi=
n,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart=
,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^gl=
obalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*=
', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^gr=
mn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu=
,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^h=
ideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisi=
licon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*'=
, '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*=
', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '=
^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,=
.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^i=
cplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imag=
is,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,=
.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ing=
enic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^=
inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontro=
l,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ir=
ondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '=
^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*',=
 '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^j=
ide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keit=
hkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', =
'^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', =
'^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', =
'^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lcte=
ch,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*',=
 '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', =
'^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*'=
, '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*',=
 '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '=
^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*'=
, '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa=
,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.=
*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear=
,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^=
mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^mel=
exis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^m=
enlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel=
,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '=
^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*=
', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^m=
itsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobi=
leye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*'=
, '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.=
*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mund=
oreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,=
.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.=
*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxe=
on,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nex=
tthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*',=
 '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*',=
 '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*=
', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', =
'^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^open=
wrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^os=
ddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,=
.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^parti=
cle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phico=
mm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '=
^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*'=
, '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid=
,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.=
*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.=
*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*'=
, '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', =
'^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^ra=
idsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*'=
, '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^r=
emarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.=
*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*'=
, '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ro=
nbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef=
,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulerc=
ontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seir=
obotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*=
', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.=
*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-e=
n,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflow=
er,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^sil=
ead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmi=
tus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sino=
wealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*'=
, '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.=
*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', =
'^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^=
spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', =
'^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*=
', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*'=
, '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,=
.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir=
,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigua=
nck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*',=
 '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.=
*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^telt=
onika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^te=
sla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '=
^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*',=
 '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^=
toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*=
', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*'=
, '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*=
', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^=
ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik=
,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^us=
r,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^var=
iscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', =
'^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^vi=
rtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vi=
vax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.=
*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*'=
, '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.=
*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', =
'^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', =
'^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisio=
n,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^x=
illybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^=
xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opt=
oelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-to=
ptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlin=
k,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^=
zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: gp=
io-6: 'gpio-export,name', 'gpio-export,output' do not match any of the rege=
xes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|=
gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),=
.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-=
mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-p=
lgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9t=
ripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*=
', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alp=
s,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^am=
d,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^amp=
ire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andest=
ech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^=
apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arc=
tic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries=
,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*',=
 '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^b=
eacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreet=
ech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.=
*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^=
bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedanc=
e,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^came=
o,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalys=
t,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '=
^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*=
', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,=
.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^=
cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnx=
t,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^cong=
atec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^c=
ortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', =
'^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cub=
ietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '=
^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*=
', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^=
dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonof=
f,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '=
^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoo=
n,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*'=
, '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^=
ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,=
.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '=
^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.=
*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*'=
, '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^encl=
ustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^eng=
icam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', =
'^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^evere=
st,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegi=
n,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairp=
hone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixi=
n,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart=
,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^gl=
obalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*=
', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^gr=
mn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu=
,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^h=
ideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisi=
licon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*'=
, '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*=
', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '=
^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,=
.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^i=
cplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imag=
is,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,=
.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ing=
enic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^=
inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontro=
l,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ir=
ondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '=
^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*',=
 '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^j=
ide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keit=
hkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', =
'^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', =
'^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', =
'^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lcte=
ch,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*',=
 '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', =
'^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*'=
, '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*',=
 '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '=
^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*'=
, '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa=
,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.=
*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear=
,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^=
mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^mel=
exis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^m=
enlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel=
,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '=
^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*=
', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^m=
itsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobi=
leye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*'=
, '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.=
*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mund=
oreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,=
.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.=
*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxe=
on,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nex=
tthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*',=
 '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*',=
 '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*=
', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', =
'^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^open=
wrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^os=
ddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,=
.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^parti=
cle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phico=
mm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '=
^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*'=
, '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid=
,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.=
*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.=
*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*'=
, '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', =
'^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^ra=
idsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*'=
, '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^r=
emarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.=
*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*'=
, '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ro=
nbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef=
,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis=
k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulerc=
ontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seir=
obotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*=
', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.=
*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-e=
n,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflow=
er,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^sil=
ead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmi=
tus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sino=
wealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*'=
, '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.=
*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', =
'^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^=
spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', =
'^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*=
', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*'=
, '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,=
.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir=
,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigua=
nck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*',=
 '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.=
*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^telt=
onika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^te=
sla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '=
^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*',=
 '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^=
toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*=
', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*'=
, '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*=
', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^=
ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik=
,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^us=
r,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^var=
iscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', =
'^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^vi=
rtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vi=
vax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.=
*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*'=
, '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.=
*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', =
'^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', =
'^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisio=
n,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^x=
illybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^=
xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opt=
oelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-to=
ptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlin=
k,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^=
zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /m=
ikro-bus/gpio-export@1: failed to match any schema with compatible: ['gpio-=
export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: gp=
io-46: 'gpio-export,name', 'gpio-export,output' do not match any of the reg=
exes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key=
|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc)=
,.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa=
-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-=
plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9=
tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#=
_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,=
.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^=
acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^=
ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*=
', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^a=
esop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-networ=
k,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.=
*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^al=
ps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^a=
md,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^am=
pire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andes=
tech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '=
^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^ar=
ctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^arie=
s,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*'=
, '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '=
^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^a=
tlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '=
^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.=
*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^=
beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtree=
tech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,=
.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '=
^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedan=
ce,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cam=
eo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^cataly=
st,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', =
'^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.=
*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp=
,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '=
^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cn=
xt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^con=
gatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^=
cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*',=
 '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cu=
bietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', =
'^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.=
*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '=
^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimono=
ff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwo=
on,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*=
', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '=
^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt=
,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', =
'^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,=
.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*=
', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enc=
lustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^en=
gicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*',=
 '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^ever=
est,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exeg=
in,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fair=
phone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feix=
in,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^g=
lobalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.=
*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^g=
rmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoy=
u,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^=
hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^his=
ilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*=
', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.=
*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', =
'^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek=
,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^=
icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^ima=
gis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec=
,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^in=
genic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '=
^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontr=
ol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^i=
rondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', =
'^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*'=
, '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^=
jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^kei=
thkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*',=
 '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*',=
 '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*',=
 '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lct=
ech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*'=
, '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*=
', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*=
', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lx=
a,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,=
.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinea=
r,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '=
^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^me=
lexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^=
menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micre=
l,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', =
'^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mun=
doreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national=
,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,=
.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netx=
eon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^ne=
xtthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*'=
, '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*'=
, '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '=
^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '=
^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.=
*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*',=
 '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^ope=
nwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^o=
sddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi=
,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^part=
icle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phic=
omm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', =
'^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*=
', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroi=
d,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,=
.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,=
.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*=
', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*',=
 '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^r=
aidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*=
', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^=
remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,=
.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*=
', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^r=
onbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sae=
f,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandi=
sk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schuler=
control,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^sei=
robotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.=
*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,=
.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-=
en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflo=
wer,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^si=
lead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconm=
itus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sin=
owealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*=
', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,=
.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*',=
 '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '=
^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*',=
 '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.=
*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*=
', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit=
,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swi=
r,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taigu=
anck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^tel=
tonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.=
*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '=
^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratroni=
k,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^u=
sr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^va=
riscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*',=
 '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^v=
irtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^v=
ivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,=
.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*=
', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,=
.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*',=
 '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*',=
 '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisi=
on,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^=
xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '=
^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-op=
toelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-t=
optech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarli=
nk,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '=
^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
