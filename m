Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F0CA45
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Apr 2026 00:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775436694; cv=none; b=d30ho6ka4jxjswsBhTA7U37h8zkeiouByo2QFhO05B9fA7vlR3jSW0EuijaCj4Yj3/voMZ/cKhJ8pjPYlBz0W6V/dq2ds9JgAg9jsIXIqVZ7OTnIfxAZjQbewh2nUuqCaInHbVNx+bY1BHT1YM2gnyrCRN2E2tVY3t8GiP/XFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775436694; c=relaxed/simple;
	bh=TmeJ6b3rnUqT4NLaYSxI94eUozuF+mjc+P+PyqpK/UI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jecOZDGjRnF3m0Kqze2W0BDo9o12soidXlRfQE96pTYusQJElxzYgMQki9Zo+bvM01oZZ0uKMMp6/nJpWQugDdexVo22lP8+x4aGm1fP5eu46YLKPCynaq5hovh18x76mRO57o08I9y70KcRwKVBa3xPJk1VYF0BOfSwQusDCg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZWBS1rc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZWBS1rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775436679; x=1806972679;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TmeJ6b3rnUqT4NLaYSxI94eUozuF+mjc+P+PyqpK/UI=;
  b=XZWBS1rcz+/cr7KtMCh0iBJZR0ydkHctt9mxExpX0eZdZ6v90zvue8SJ
   KaxHrEc6Z3TtlQu78rHmsEpPLZPSZQxQO1AZpmzsBiv8aGjdtd7ySjTHm
   1pnasIyqO7LrRfy5JEhmqr64ckpcHHYglSFiRRoYS5TQE1zUF5lDozkRT
   /L66D3wkYeyhK8zUd7aTm+H1+679CxdVO7K0ilmdy6qGiCyYKen/efkcK
   NwLq+ydCJm8aoPH+FPBnV/svyQc37RmQy+0KPm2AF227apabtvu4c7VDB
   tQXicUhtFfk/n1KqNZOZkwcddVrlLQZked5c63GBSpEsZzk+9DAeLHOM7
   A==;
X-CSE-ConnectionGUID: 3q/YbQzoT+20zNUWrus05w==
X-CSE-MsgGUID: 8vA/JUMkRyaNPFburCtNLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="101853396"
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; 
   d="scan'208";a="101853396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 17:51:18 -0700
X-CSE-ConnectionGUID: tR5sszUDQMOb7C23fyLvcQ==
X-CSE-MsgGUID: 8cZfqT5lQ3CQBn1gXpI15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; 
   d="scan'208";a="224502682"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2026 17:51:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9YBO-000000009wj-0UJd;
	Mon, 06 Apr 2026 00:51:14 +0000
Date: Mon, 06 Apr 2026 02:51:11 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 60/101]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /
 (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
Message-ID: <202604060233.qcl3hiLd-lkp@intel.com>
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
commit: 8b4b7217995c10a8cbc57b63d795f206a7a644b1 [60/101] arm64: dts: build=
 overlays for bpi-r4-lite emmc/sd + nand/nor
config: arm64-randconfig-2052-20260403 (https://download.01.org/0day-ci/arc=
hive/20260406/202604060233.qcl3hiLd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260406/202604060233.qcl3hiLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604060233.qcl3hiLd-lkp@i=
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/trng@1020f000: failed to match any schema with compatible: ['mediatek=
,mt7987-rng']
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
ypto', 'mediatek,mt7986-crypto']
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
ies,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*=
', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '=
^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^at=
mel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^a=
vnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.=
*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^=
belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^b=
laize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary=
,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^b=
uffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cala=
o,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^cani=
nos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,=
.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*'=
, '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspa=
rk,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuw=
i,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '=
^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^co=
mpal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^c=
oreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^cre=
ative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*'=
, '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress=
,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*',=
 '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*',=
 '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi=
,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.=
*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '=
^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv=
,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*'=
, '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan=
,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*',=
 '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', =
'^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endi=
an,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engle=
der,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswi=
n,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisi=
on,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*',=
 '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascont=
ek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '=
^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.=
*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*=
', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.=
*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.=
*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemte=
k,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^gian=
tplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^g=
ocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '=
^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*=
', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacous=
tics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsc=
hmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis=
,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*=
', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingen=
ic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^in=
side-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,=
.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iron=
device,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^i=
tian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '=
^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jid=
e,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech=
,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '=
^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^=
lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '=
^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^l=
ongcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', =
'^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*=
', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell=
,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayquee=
n,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^=
medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mel=
lanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mer=
aki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micr=
ocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*=
', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*'=
, '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^=
moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*',=
 '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^=
mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^=
mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*',=
 '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic=
,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newh=
aven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicer=
a,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
 '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoc=
hip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '=
^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*'=
, '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portw=
ell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy=
,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '=
^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.=
*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '=
^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^r=
aspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^=
realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*'=
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*'=
, '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^=
rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rose=
applepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec=
,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*=
', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^se=
agate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '=
^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgm=
icro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworl=
d,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^sieme=
ns,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^=
silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', =
'^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinli=
nx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.=
*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartla=
bs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^s=
ocionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sop=
hgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*',=
 '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.=
*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*=
', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.=
*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus=
,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology=
,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*=
', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '=
^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teeje=
t,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^tera=
sic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^th=
ingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*=
', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^to=
pwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,=
.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^=
tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.=
*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '=
^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*',=
 '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*'=
, '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscit=
e,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^=
videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',=
 '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^v=
oltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglo=
ng,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^=
wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligea=
r,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^wins=
en,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', =
'^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaom=
i,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiph=
era,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', =
'^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*'=
, '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '=
^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii=
,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
ies,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*=
', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '=
^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^at=
mel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^a=
vnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.=
*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^=
belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^b=
laize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary=
,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^b=
uffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cala=
o,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^cani=
nos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,=
.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*'=
, '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspa=
rk,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuw=
i,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '=
^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^co=
mpal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^c=
oreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^cre=
ative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*'=
, '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress=
,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*',=
 '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*',=
 '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi=
,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.=
*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '=
^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv=
,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*'=
, '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan=
,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*',=
 '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', =
'^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endi=
an,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engle=
der,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswi=
n,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisi=
on,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*',=
 '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascont=
ek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '=
^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.=
*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*=
', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.=
*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.=
*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemte=
k,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^gian=
tplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^g=
ocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '=
^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*=
', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacous=
tics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsc=
hmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis=
,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*=
', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingen=
ic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^in=
side-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,=
.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iron=
device,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^i=
tian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '=
^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jid=
e,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech=
,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '=
^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^=
lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '=
^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^l=
ongcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', =
'^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*=
', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell=
,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayquee=
n,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^=
medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mel=
lanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mer=
aki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micr=
ocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*=
', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*'=
, '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^=
moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*',=
 '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^=
mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^=
mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*',=
 '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic=
,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newh=
aven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicer=
a,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
 '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoc=
hip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '=
^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*'=
, '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portw=
ell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy=
,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '=
^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.=
*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '=
^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^r=
aspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^=
realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*'=
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*'=
, '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^=
rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rose=
applepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec=
,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*=
', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^se=
agate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '=
^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgm=
icro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworl=
d,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^sieme=
ns,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^=
silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', =
'^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinli=
nx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.=
*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartla=
bs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^s=
ocionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sop=
hgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*',=
 '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.=
*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*=
', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.=
*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus=
,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology=
,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*=
', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '=
^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teeje=
t,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^tera=
sic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^th=
ingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*=
', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^to=
pwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,=
.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^=
tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.=
*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '=
^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*',=
 '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*'=
, '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscit=
e,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^=
videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',=
 '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^v=
oltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglo=
ng,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^=
wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligea=
r,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^wins=
en,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', =
'^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaom=
i,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiph=
era,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', =
'^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*'=
, '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '=
^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii=
,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
ies,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*=
', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '=
^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^at=
mel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^a=
vnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.=
*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^=
belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^b=
laize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary=
,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^b=
uffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cala=
o,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^cani=
nos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,=
.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*'=
, '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspa=
rk,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuw=
i,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '=
^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^co=
mpal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^c=
oreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^cre=
ative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*'=
, '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress=
,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*',=
 '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*',=
 '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi=
,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.=
*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '=
^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv=
,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*'=
, '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan=
,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*',=
 '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', =
'^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endi=
an,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engle=
der,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswi=
n,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisi=
on,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*',=
 '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascont=
ek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '=
^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.=
*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*=
', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.=
*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.=
*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemte=
k,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^gian=
tplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^g=
ocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '=
^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*=
', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacous=
tics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsc=
hmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis=
,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*=
', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingen=
ic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^in=
side-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,=
.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iron=
device,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^i=
tian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '=
^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jid=
e,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech=
,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '=
^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^=
lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '=
^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^l=
ongcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', =
'^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*=
', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell=
,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayquee=
n,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^=
medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mel=
lanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mer=
aki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micr=
ocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*=
', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*'=
, '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^=
moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*',=
 '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^=
mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^=
mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*',=
 '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic=
,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newh=
aven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicer=
a,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
 '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoc=
hip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '=
^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*'=
, '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portw=
ell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy=
,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '=
^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.=
*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '=
^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^r=
aspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^=
realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*'=
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*'=
, '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^=
rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rose=
applepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec=
,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*=
', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^se=
agate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '=
^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgm=
icro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworl=
d,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^sieme=
ns,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^=
silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', =
'^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinli=
nx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.=
*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartla=
bs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^s=
ocionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sop=
hgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*',=
 '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.=
*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*=
', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.=
*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus=
,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology=
,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*=
', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '=
^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teeje=
t,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^tera=
sic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^th=
ingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*=
', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^to=
pwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,=
.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^=
tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.=
*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '=
^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*',=
 '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*'=
, '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscit=
e,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^=
videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',=
 '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^v=
oltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglo=
ng,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^=
wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligea=
r,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^wins=
en,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', =
'^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaom=
i,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiph=
era,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', =
'^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*'=
, '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '=
^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii=
,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
ies,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*=
', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '=
^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^at=
mel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^a=
vnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.=
*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^=
belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^b=
laize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary=
,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^b=
uffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cala=
o,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^cani=
nos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,=
.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*'=
, '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspa=
rk,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuw=
i,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '=
^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^co=
mpal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^c=
oreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^cre=
ative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*'=
, '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress=
,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*',=
 '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*',=
 '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi=
,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.=
*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '=
^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv=
,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*'=
, '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan=
,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*',=
 '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', =
'^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endi=
an,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engle=
der,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswi=
n,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisi=
on,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*',=
 '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascont=
ek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '=
^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.=
*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*=
', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.=
*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.=
*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemte=
k,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^gian=
tplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^g=
ocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '=
^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*=
', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacous=
tics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsc=
hmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis=
,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*=
', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingen=
ic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^in=
side-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,=
.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iron=
device,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^i=
tian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '=
^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jid=
e,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech=
,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '=
^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^=
lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '=
^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^l=
ongcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', =
'^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*=
', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell=
,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayquee=
n,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^=
medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mel=
lanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mer=
aki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micr=
ocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*=
', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*'=
, '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^=
moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*',=
 '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^=
mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^=
mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*',=
 '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic=
,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newh=
aven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicer=
a,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
 '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoc=
hip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '=
^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*'=
, '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portw=
ell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy=
,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '=
^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.=
*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '=
^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^r=
aspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^=
realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*'=
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*'=
, '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^=
rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rose=
applepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec=
,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*=
', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^se=
agate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '=
^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgm=
icro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworl=
d,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^sieme=
ns,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^=
silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', =
'^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinli=
nx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.=
*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartla=
bs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^s=
ocionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sop=
hgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*',=
 '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.=
*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*=
', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.=
*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus=
,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology=
,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*=
', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '=
^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teeje=
t,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^tera=
sic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^th=
ingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*=
', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^to=
pwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,=
.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^=
tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.=
*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '=
^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*',=
 '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*'=
, '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscit=
e,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^=
videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',=
 '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^v=
oltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglo=
ng,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^=
wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligea=
r,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^wins=
en,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', =
'^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaom=
i,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiph=
era,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', =
'^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*'=
, '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '=
^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii=
,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
ries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.=
*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', =
'^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^a=
tmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^=
avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,=
.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '=
^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^=
blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundar=
y,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^=
buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cal=
ao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^can=
inos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct=
,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*=
', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipsp=
ark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chu=
wi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', =
'^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^c=
ompal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^=
coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^cr=
eative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*=
', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypres=
s,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*'=
, '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*'=
, '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^dig=
i,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*',=
 '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,=
.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', =
'^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^eb=
v,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*=
', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^ela=
n,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*'=
, '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*',=
 '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^end=
ian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engl=
eder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^esw=
in,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervis=
ion,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*'=
, '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascon=
tek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', =
'^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,=
.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.=
*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,=
.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,=
.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemt=
ek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^gia=
ntplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^=
gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', =
'^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.=
*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacou=
stics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirs=
chmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.=
*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*'=
, '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '=
^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.=
*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^ic=
plus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagi=
s,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.=
*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^inge=
nic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^i=
nside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol=
,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iro=
ndevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^=
itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', =
'^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^ji=
de,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keith=
koep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '=
^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '=
^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '=
^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctec=
h,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*',=
 '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', =
'^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^=
longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*',=
 '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.=
*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvel=
l,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayque=
en,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '=
^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
llanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^me=
raki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^mic=
rocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.=
*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*=
', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*'=
, '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '=
^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*'=
, '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '=
^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '=
^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*'=
, '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogi=
c,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^new=
haven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nice=
ra,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*'=
, '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*'=
, '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oce=
anic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olp=
c,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^o=
palkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpand=
ora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orise=
tech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^ove=
rkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^para=
de,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^perico=
m,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^pico=
chip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', =
'^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*=
', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^port=
well,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkidd=
y,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', =
'^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,=
.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', =
'^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^=
raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '=
^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*=
', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*=
', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '=
^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ros=
eapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samte=
c,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.=
*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^s=
eagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', =
'^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sg=
micro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewor=
ld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siem=
ens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '=
^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*',=
 '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinl=
inx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,=
.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartl=
abs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^=
socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^so=
phgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*'=
, '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,=
.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.=
*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,=
.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplu=
s,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synolog=
y,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.=
*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', =
'^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teej=
et,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^ter=
asic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^t=
hingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.=
*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^t=
opwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink=
,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '=
^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,=
.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', =
'^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*'=
, '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*=
', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^varisci=
te,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '=
^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*'=
, '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^=
voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchangl=
ong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '=
^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wilige=
ar,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^win=
sen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*',=
 '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiao=
mi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xip=
hera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*',=
 '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*=
', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', =
'^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zi=
i,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/trng@1020f000: failed to match any schema with compatible: ['mediatek,=
mt7987-rng']
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
ypto', 'mediatek,mt7986-crypto']
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
es,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*'=
, '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^=
asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atm=
el,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^av=
net,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*=
', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^b=
elling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bl=
aize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,=
.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^bu=
ffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao=
,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canin=
os,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.=
*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*',=
 '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspar=
k,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi=
,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^=
cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^com=
pal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^co=
reriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^crea=
tive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*',=
 '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,=
.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', =
'^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', =
'^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,=
.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*=
', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^=
dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,=
.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*',=
 '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,=
.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', =
'^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '=
^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endia=
n,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin=
,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisio=
n,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', =
'^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fasconte=
k,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*=
', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*'=
, '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*=
', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*=
', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek=
,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giant=
plus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^go=
controll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^=
gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*'=
, '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoust=
ics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsch=
mann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icpl=
us,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,=
.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*'=
, '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingeni=
c,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^ins=
ide-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.=
*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irond=
evice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^it=
ian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^=
jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide=
,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^=
lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^l=
incolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^=
liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lo=
ngcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '=
^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*'=
, '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,=
.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen=
,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^m=
edion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*',=
 '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', =
'^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^m=
oortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', =
'^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^m=
star,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^m=
xic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', =
'^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,=
.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newha=
ven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', =
'^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', =
'^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocean=
ic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,=
.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opa=
lkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandor=
a,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,=
.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwe=
ll,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,=
.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^=
pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*=
', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^=
quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ra=
spberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^r=
ealtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*',=
 '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*'=
, '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^sea=
gate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^=
sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmi=
cro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld=
,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemen=
s,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^s=
ilabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '=
^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlin=
x,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*=
', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlab=
s,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^so=
cionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^soph=
go,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', =
'^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*=
', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*'=
, '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*=
', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,=
.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,=
.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', =
'^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*',=
 '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite=
,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^v=
ideostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', =
'^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vo=
ltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglon=
g,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^w=
etek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear=
,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winse=
n,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '=
^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi=
,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphe=
ra,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '=
^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*',=
 '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^=
yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,=
.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
es,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*'=
, '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^=
asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atm=
el,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^av=
net,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*=
', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^b=
elling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bl=
aize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,=
.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^bu=
ffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao=
,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canin=
os,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.=
*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*',=
 '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspar=
k,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi=
,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^=
cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^com=
pal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^co=
reriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^crea=
tive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*',=
 '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,=
.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', =
'^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', =
'^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,=
.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*=
', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^=
dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,=
.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*',=
 '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,=
.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', =
'^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '=
^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endia=
n,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin=
,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisio=
n,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', =
'^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fasconte=
k,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*=
', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*'=
, '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*=
', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*=
', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek=
,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giant=
plus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^go=
controll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^=
gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*'=
, '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoust=
ics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsch=
mann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icpl=
us,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,=
.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*'=
, '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingeni=
c,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^ins=
ide-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.=
*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irond=
evice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^it=
ian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^=
jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide=
,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^=
lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^l=
incolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^=
liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lo=
ngcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '=
^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*'=
, '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,=
.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen=
,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^m=
edion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*',=
 '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', =
'^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^m=
oortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', =
'^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^m=
star,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^m=
xic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', =
'^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,=
.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newha=
ven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', =
'^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', =
'^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocean=
ic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,=
.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opa=
lkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandor=
a,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,=
.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwe=
ll,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,=
.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^=
pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*=
', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^=
quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ra=
spberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^r=
ealtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*',=
 '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*'=
, '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^sea=
gate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^=
sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmi=
cro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld=
,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemen=
s,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^s=
ilabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '=
^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlin=
x,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*=
', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlab=
s,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^so=
cionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^soph=
go,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', =
'^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*=
', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*'=
, '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*=
', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,=
.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,=
.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', =
'^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*',=
 '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite=
,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^v=
ideostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', =
'^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vo=
ltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglon=
g,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^w=
etek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear=
,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winse=
n,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '=
^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi=
,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphe=
ra,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '=
^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*',=
 '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^=
yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,=
.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
es,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*'=
, '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^=
asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atm=
el,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^av=
net,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*=
', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^b=
elling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bl=
aize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,=
.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^bu=
ffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao=
,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canin=
os,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.=
*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*',=
 '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspar=
k,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi=
,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^=
cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^com=
pal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^co=
reriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^crea=
tive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*',=
 '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,=
.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', =
'^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', =
'^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,=
.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*=
', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^=
dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,=
.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*',=
 '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,=
.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', =
'^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '=
^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endia=
n,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin=
,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisio=
n,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', =
'^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fasconte=
k,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*=
', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*'=
, '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*=
', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*=
', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek=
,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giant=
plus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^go=
controll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^=
gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*'=
, '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoust=
ics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsch=
mann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icpl=
us,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,=
.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*'=
, '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingeni=
c,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^ins=
ide-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.=
*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irond=
evice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^it=
ian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^=
jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide=
,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^=
lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^l=
incolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^=
liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lo=
ngcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '=
^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*'=
, '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,=
.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen=
,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^m=
edion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*',=
 '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', =
'^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^m=
oortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', =
'^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^m=
star,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^m=
xic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', =
'^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,=
.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newha=
ven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', =
'^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', =
'^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocean=
ic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,=
.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opa=
lkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandor=
a,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,=
.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwe=
ll,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,=
.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^=
pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*=
', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^=
quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ra=
spberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^r=
ealtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*',=
 '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*'=
, '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^sea=
gate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^=
sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmi=
cro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld=
,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemen=
s,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^s=
ilabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '=
^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlin=
x,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*=
', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlab=
s,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^so=
cionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^soph=
go,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', =
'^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*=
', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*'=
, '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*=
', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,=
.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,=
.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', =
'^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*',=
 '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite=
,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^v=
ideostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', =
'^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vo=
ltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglon=
g,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^w=
etek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear=
,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winse=
n,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '=
^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi=
,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphe=
ra,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '=
^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*',=
 '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^=
yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,=
.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
es,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*'=
, '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^=
asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atm=
el,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^av=
net,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*=
', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^b=
elling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bl=
aize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,=
.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^bu=
ffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao=
,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canin=
os,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.=
*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*',=
 '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspar=
k,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi=
,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^=
cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^com=
pal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^co=
reriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^crea=
tive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*',=
 '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,=
.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', =
'^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', =
'^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,=
.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*=
', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^=
dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,=
.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*',=
 '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,=
.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', =
'^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '=
^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endia=
n,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin=
,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisio=
n,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', =
'^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fasconte=
k,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*=
', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*'=
, '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*=
', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*=
', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek=
,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giant=
plus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^go=
controll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^=
gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*'=
, '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoust=
ics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsch=
mann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icpl=
us,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,=
.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*'=
, '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingeni=
c,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^ins=
ide-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.=
*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irond=
evice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^it=
ian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^=
jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide=
,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^=
lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^l=
incolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^=
liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lo=
ngcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '=
^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*'=
, '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,=
.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen=
,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^m=
edion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*',=
 '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', =
'^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^m=
oortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', =
'^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^m=
star,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^m=
xic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', =
'^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,=
.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newha=
ven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', =
'^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', =
'^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocean=
ic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,=
.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opa=
lkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandor=
a,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,=
.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwe=
ll,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,=
.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^=
pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*=
', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^=
quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ra=
spberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^r=
ealtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*',=
 '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*'=
, '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^sea=
gate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^=
sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmi=
cro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld=
,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemen=
s,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^s=
ilabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '=
^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlin=
x,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*=
', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlab=
s,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^so=
cionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^soph=
go,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', =
'^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*=
', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*'=
, '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*=
', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,=
.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,=
.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', =
'^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*',=
 '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite=
,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^v=
ideostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', =
'^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vo=
ltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglon=
g,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^w=
etek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear=
,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winse=
n,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '=
^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi=
,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphe=
ra,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '=
^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*',=
 '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^=
yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,=
.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
ies,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*=
', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '=
^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^at=
mel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^a=
vnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.=
*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^=
belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^b=
laize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary=
,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^b=
uffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cala=
o,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^cani=
nos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,=
.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*'=
, '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspa=
rk,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuw=
i,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '=
^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^co=
mpal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^c=
oreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^cre=
ative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*'=
, '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress=
,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*',=
 '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*',=
 '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi=
,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.=
*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '=
^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv=
,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*'=
, '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan=
,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*',=
 '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', =
'^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endi=
an,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engle=
der,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswi=
n,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisi=
on,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*',=
 '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascont=
ek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '=
^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.=
*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*=
', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.=
*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.=
*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemte=
k,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^gian=
tplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^g=
ocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '=
^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*=
', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacous=
tics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsc=
hmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis=
,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*=
', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingen=
ic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^in=
side-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,=
.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iron=
device,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^i=
tian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '=
^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jid=
e,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech=
,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '=
^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^=
lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '=
^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^l=
ongcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', =
'^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*=
', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell=
,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayquee=
n,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^=
medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mel=
lanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mer=
aki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micr=
ocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*=
', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*'=
, '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^=
moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*',=
 '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^=
mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^=
mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*',=
 '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic=
,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newh=
aven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicer=
a,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
 '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoc=
hip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '=
^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*'=
, '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portw=
ell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy=
,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '=
^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.=
*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '=
^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^r=
aspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^=
realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*'=
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*'=
, '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^=
rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rose=
applepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec=
,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*=
', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^se=
agate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '=
^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgm=
icro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworl=
d,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^sieme=
ns,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^=
silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', =
'^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinli=
nx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.=
*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartla=
bs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^s=
ocionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sop=
hgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*',=
 '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.=
*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*=
', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.=
*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus=
,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology=
,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*=
', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '=
^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teeje=
t,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^tera=
sic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^th=
ingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*=
', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^to=
pwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,=
.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^=
tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.=
*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '=
^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*',=
 '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*'=
, '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscit=
e,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^=
videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',=
 '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^v=
oltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglo=
ng,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^=
wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligea=
r,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^wins=
en,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', =
'^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaom=
i,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiph=
era,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', =
'^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*'=
, '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '=
^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii=
,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/trng@1020f000: failed to match any schema with compatible: ['mediatek,m=
t7987-rng']
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
ypto', 'mediatek,mt7986-crypto']
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
s,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*',=
 '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^a=
srock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atme=
l,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buf=
falo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,=
.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canino=
s,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*=
', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', =
'^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark=
,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,=
.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^c=
loos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^comp=
al,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^cor=
eriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creat=
ive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', =
'^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.=
*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '=
^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '=
^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.=
*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^=
dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*'=
, '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^d=
ynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.=
*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', =
'^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.=
*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '=
^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^=
empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian=
,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^englede=
r,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,=
.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision=
,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '=
^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek=
,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^f=
irefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*'=
, '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*',=
 '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*'=
, '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*'=
, '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,=
.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantp=
lus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goc=
ontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^g=
plus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*',=
 '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacousti=
cs,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschm=
ann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplu=
s,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.=
*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*',=
 '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic=
,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insi=
de-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*=
', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ironde=
vice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^iti=
an,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^j=
edec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,=
.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoe=
p,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^ki=
ngdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^ko=
e,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^la=
ird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.=
*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^l=
g,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^li=
ncolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^=
linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^l=
iteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lon=
gcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^=
luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*',=
 '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.=
*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,=
.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^me=
dion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*',=
 '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', =
'^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '=
^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^mo=
ortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '=
^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^ms=
tar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mx=
ic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '=
^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.=
*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhav=
en,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,=
.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '=
^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '=
^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceani=
c,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.=
*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opal=
kelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora=
,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetec=
h,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overki=
z,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,=
.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.=
*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochi=
p,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^p=
lantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', =
'^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwel=
l,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.=
*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^p=
ulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*'=
, '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^q=
uanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ras=
pberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^re=
altek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', =
'^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', =
'^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^ro=
cktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseap=
plepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.=
*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',=
 '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seag=
ate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^s=
ensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmic=
ro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,=
.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens=
,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^si=
labs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^=
siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx=
,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*'=
, '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs=
,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soc=
ionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophg=
o,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '=
^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*'=
, '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*',=
 '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*'=
, '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.=
*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.=
*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vi=
deostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '=
^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vol=
tafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong=
,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^we=
tek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,=
.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen=
,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^=
wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,=
.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xipher=
a,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^=
yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', =
'^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^y=
uzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.=
*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
s,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*',=
 '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^a=
srock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atme=
l,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buf=
falo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,=
.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canino=
s,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*=
', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', =
'^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark=
,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,=
.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^c=
loos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^comp=
al,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^cor=
eriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creat=
ive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', =
'^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.=
*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '=
^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '=
^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.=
*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^=
dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*'=
, '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^d=
ynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.=
*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', =
'^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.=
*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '=
^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^=
empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian=
,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^englede=
r,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,=
.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision=
,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '=
^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek=
,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^f=
irefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*'=
, '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*',=
 '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*'=
, '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*'=
, '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,=
.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantp=
lus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goc=
ontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^g=
plus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*',=
 '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacousti=
cs,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschm=
ann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplu=
s,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.=
*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*',=
 '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic=
,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insi=
de-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*=
', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ironde=
vice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^iti=
an,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^j=
edec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,=
.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoe=
p,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^ki=
ngdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^ko=
e,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^la=
ird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.=
*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^l=
g,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^li=
ncolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^=
linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^l=
iteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lon=
gcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^=
luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*',=
 '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.=
*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,=
.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^me=
dion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*',=
 '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', =
'^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '=
^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^mo=
ortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '=
^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^ms=
tar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mx=
ic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '=
^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.=
*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhav=
en,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,=
.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '=
^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '=
^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceani=
c,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.=
*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opal=
kelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora=
,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetec=
h,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overki=
z,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,=
.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.=
*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochi=
p,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^p=
lantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', =
'^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwel=
l,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.=
*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^p=
ulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*'=
, '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^q=
uanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ras=
pberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^re=
altek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', =
'^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', =
'^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^ro=
cktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseap=
plepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.=
*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',=
 '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seag=
ate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^s=
ensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmic=
ro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,=
.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens=
,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^si=
labs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^=
siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx=
,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*'=
, '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs=
,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soc=
ionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophg=
o,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '=
^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*'=
, '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*',=
 '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*'=
, '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.=
*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.=
*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vi=
deostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '=
^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vol=
tafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong=
,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^we=
tek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,=
.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen=
,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^=
wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,=
.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xipher=
a,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^=
yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', =
'^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^y=
uzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.=
*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
s,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*',=
 '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^a=
srock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atme=
l,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buf=
falo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,=
.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canino=
s,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*=
', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', =
'^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark=
,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,=
.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^c=
loos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^comp=
al,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^cor=
eriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creat=
ive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', =
'^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.=
*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '=
^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '=
^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.=
*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^=
dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*'=
, '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^d=
ynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.=
*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', =
'^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.=
*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '=
^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^=
empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian=
,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^englede=
r,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,=
.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision=
,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '=
^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek=
,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^f=
irefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*'=
, '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*',=
 '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*'=
, '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*'=
, '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,=
.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantp=
lus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goc=
ontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^g=
plus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*',=
 '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacousti=
cs,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschm=
ann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplu=
s,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.=
*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*',=
 '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic=
,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insi=
de-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*=
', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ironde=
vice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^iti=
an,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^j=
edec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,=
.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoe=
p,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^ki=
ngdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^ko=
e,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^la=
ird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.=
*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^l=
g,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^li=
ncolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^=
linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^l=
iteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lon=
gcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^=
luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*',=
 '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.=
*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,=
.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^me=
dion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*',=
 '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', =
'^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '=
^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^mo=
ortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '=
^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^ms=
tar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mx=
ic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '=
^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.=
*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhav=
en,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,=
.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '=
^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '=
^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceani=
c,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.=
*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opal=
kelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora=
,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetec=
h,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overki=
z,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,=
.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.=
*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochi=
p,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^p=
lantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', =
'^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwel=
l,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.=
*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^p=
ulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*'=
, '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^q=
uanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ras=
pberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^re=
altek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', =
'^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', =
'^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^ro=
cktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseap=
plepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.=
*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',=
 '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seag=
ate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^s=
ensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmic=
ro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,=
.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens=
,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^si=
labs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^=
siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx=
,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*'=
, '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs=
,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soc=
ionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophg=
o,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '=
^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*'=
, '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*',=
 '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*'=
, '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.=
*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.=
*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vi=
deostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '=
^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vol=
tafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong=
,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^we=
tek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,=
.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen=
,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^=
wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,=
.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xipher=
a,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^=
yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', =
'^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^y=
uzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.=
*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
s,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*',=
 '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^a=
srock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atme=
l,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buf=
falo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,=
.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canino=
s,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*=
', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', =
'^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark=
,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,=
.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^c=
loos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^comp=
al,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^cor=
eriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creat=
ive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', =
'^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.=
*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '=
^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '=
^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.=
*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^=
dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*'=
, '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^d=
ynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.=
*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', =
'^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.=
*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '=
^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^=
empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian=
,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^englede=
r,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,=
.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision=
,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '=
^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek=
,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^f=
irefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*'=
, '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*',=
 '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*'=
, '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*'=
, '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,=
.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantp=
lus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goc=
ontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^g=
plus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*',=
 '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacousti=
cs,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschm=
ann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplu=
s,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.=
*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*',=
 '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic=
,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insi=
de-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*=
', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ironde=
vice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^iti=
an,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^j=
edec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,=
.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoe=
p,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^ki=
ngdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^ko=
e,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^la=
ird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.=
*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^l=
g,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^li=
ncolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^=
linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^l=
iteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lon=
gcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^=
luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*',=
 '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.=
*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,=
.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^me=
dion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*',=
 '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', =
'^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '=
^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^mo=
ortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '=
^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^ms=
tar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mx=
ic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '=
^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.=
*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhav=
en,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,=
.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '=
^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '=
^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceani=
c,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.=
*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opal=
kelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora=
,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetec=
h,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overki=
z,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,=
.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.=
*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochi=
p,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^p=
lantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', =
'^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwel=
l,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.=
*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^p=
ulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*'=
, '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^q=
uanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ras=
pberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^re=
altek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', =
'^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', =
'^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^ro=
cktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseap=
plepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.=
*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',=
 '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seag=
ate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^s=
ensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmic=
ro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,=
.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens=
,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^si=
labs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^=
siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx=
,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*'=
, '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs=
,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soc=
ionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophg=
o,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '=
^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*'=
, '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*',=
 '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*'=
, '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.=
*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.=
*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vi=
deostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '=
^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vol=
tafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong=
,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^we=
tek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,=
.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen=
,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^=
wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,=
.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xipher=
a,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^=
yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', =
'^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^y=
uzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.=
*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
es,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*'=
, '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^=
asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atm=
el,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^av=
net,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*=
', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^b=
elling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bl=
aize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,=
.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^bu=
ffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao=
,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canin=
os,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.=
*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*',=
 '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspar=
k,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi=
,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^=
cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^com=
pal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^co=
reriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^crea=
tive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*',=
 '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,=
.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', =
'^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', =
'^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,=
.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*=
', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^=
dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,=
.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*',=
 '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,=
.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', =
'^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '=
^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endia=
n,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin=
,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervisio=
n,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', =
'^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fasconte=
k,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*=
', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*'=
, '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*=
', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*=
', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek=
,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giant=
plus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^go=
controll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^=
gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*'=
, '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoust=
ics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirsch=
mann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icpl=
us,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,=
.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*'=
, '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingeni=
c,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^ins=
ide-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.=
*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irond=
evice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^it=
ian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^=
jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide=
,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^=
lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^l=
incolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^=
liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lo=
ngcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '=
^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*'=
, '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,=
.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen=
,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^m=
edion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*',=
 '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', =
'^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^m=
oortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', =
'^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^m=
star,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^m=
xic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', =
'^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,=
.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newha=
ven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', =
'^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', =
'^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocean=
ic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,=
.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opa=
lkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandor=
a,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,=
.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwe=
ll,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,=
.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^=
pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*=
', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^=
quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ra=
spberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^r=
ealtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*',=
 '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*'=
, '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^sea=
gate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^=
sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmi=
cro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld=
,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemen=
s,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^s=
ilabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '=
^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlin=
x,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*=
', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlab=
s,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^so=
cionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^soph=
go,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', =
'^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*=
', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*'=
, '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*=
', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,=
.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,=
.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', =
'^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*',=
 '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite=
,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^v=
ideostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', =
'^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vo=
ltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglon=
g,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^w=
etek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear=
,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winse=
n,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '=
^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi=
,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphe=
ra,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '=
^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*',=
 '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^=
yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,=
.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/trng@1020f000: failed to match any schema with compatible: ['mediatek,mt=
7987-rng']
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
ypto', 'mediatek,mt7986-crypto']
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
,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', =
'^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^as=
rock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel=
,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avne=
t,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blai=
ze,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*=
', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buff=
alo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.=
*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos=
,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*'=
, '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '=
^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,=
.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.=
*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cl=
oos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compa=
l,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^core=
river,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creati=
ve,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '=
^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*=
', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^=
deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^=
devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*=
', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^d=
lc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*',=
 '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dy=
naimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*=
', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '=
^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*=
', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^=
embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^e=
mpire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,=
.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder=
,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^fi=
refly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*',=
 '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', =
'^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*',=
 '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*',=
 '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.=
*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantpl=
us,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goco=
ntroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gp=
lus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', =
'^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustic=
s,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', =
'^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^=
hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hug=
sun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', =
'^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus=
,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*=
', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', =
'^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,=
.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insid=
e-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*'=
, '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondev=
ice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itia=
n,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^je=
dec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.=
*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep=
,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kin=
gdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe=
,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^lai=
rd,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*=
', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg=
,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lin=
colntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^l=
inksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^li=
teon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^long=
cheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^l=
uckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', =
'^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*=
', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.=
*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^med=
ion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellan=
ox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki=
,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcr=
ystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', =
'^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '=
^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^=
mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moo=
rtec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^=
mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mst=
ar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxi=
c,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^=
neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*=
', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhave=
n,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.=
*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^=
novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^=
nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic=
,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*=
', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalk=
elly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,=
.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech=
,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz=
,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.=
*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*=
', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip=
,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^pl=
antower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '=
^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell=
,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*=
', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pu=
lsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*',=
 '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^qu=
anta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^rasp=
berrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^rea=
ltek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '=
^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '=
^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^roc=
ktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapp=
lepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*=
', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', =
'^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seaga=
te,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^se=
nsirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicr=
o,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.=
*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,=
.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^sil=
abs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^s=
iliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,=
.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*',=
 '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,=
.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soci=
onext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*=
', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', =
'^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^te=
chnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.=
*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic=
,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thing=
yjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', =
'^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwi=
se,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*'=
, '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tro=
nsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*',=
 '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^ud=
oo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^=
uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '=
^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.=
*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vid=
eostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^=
vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^volt=
afield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,=
.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wet=
ek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.=
*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,=
.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^w=
obo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.=
*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera=
,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^y=
amaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '=
^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yu=
zukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*=
', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', =
'^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^as=
rock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel=
,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avne=
t,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blai=
ze,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*=
', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buff=
alo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.=
*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos=
,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*'=
, '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '=
^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,=
.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.=
*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cl=
oos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compa=
l,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^core=
river,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creati=
ve,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '=
^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*=
', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^=
deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^=
devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*=
', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^d=
lc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*',=
 '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dy=
naimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*=
', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '=
^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*=
', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^=
embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^e=
mpire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,=
.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder=
,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^fi=
refly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*',=
 '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', =
'^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*',=
 '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*',=
 '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.=
*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantpl=
us,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goco=
ntroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gp=
lus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', =
'^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustic=
s,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', =
'^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^=
hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hug=
sun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', =
'^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus=
,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*=
', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', =
'^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,=
.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insid=
e-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*'=
, '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondev=
ice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itia=
n,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^je=
dec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.=
*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep=
,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kin=
gdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe=
,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^lai=
rd,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*=
', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg=
,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lin=
colntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^l=
inksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^li=
teon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^long=
cheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^l=
uckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', =
'^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*=
', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.=
*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^med=
ion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellan=
ox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki=
,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcr=
ystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', =
'^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '=
^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^=
mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moo=
rtec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^=
mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mst=
ar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxi=
c,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^=
neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*=
', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhave=
n,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.=
*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^=
novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^=
nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic=
,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*=
', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalk=
elly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,=
.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech=
,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz=
,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.=
*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*=
', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip=
,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^pl=
antower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '=
^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell=
,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*=
', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pu=
lsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*',=
 '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^qu=
anta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^rasp=
berrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^rea=
ltek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '=
^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '=
^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^roc=
ktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapp=
lepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*=
', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', =
'^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seaga=
te,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^se=
nsirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicr=
o,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.=
*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,=
.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^sil=
abs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^s=
iliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,=
.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*',=
 '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,=
.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soci=
onext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*=
', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', =
'^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^te=
chnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.=
*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic=
,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thing=
yjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', =
'^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwi=
se,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*'=
, '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tro=
nsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*',=
 '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^ud=
oo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^=
uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '=
^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.=
*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vid=
eostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^=
vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^volt=
afield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,=
.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wet=
ek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.=
*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,=
.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^w=
obo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.=
*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera=
,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^y=
amaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '=
^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yu=
zukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*=
', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', =
'^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^as=
rock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel=
,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avne=
t,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blai=
ze,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*=
', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buff=
alo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.=
*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos=
,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*'=
, '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '=
^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,=
.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.=
*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cl=
oos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compa=
l,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^core=
river,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creati=
ve,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '=
^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*=
', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^=
deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^=
devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*=
', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^d=
lc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*',=
 '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dy=
naimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*=
', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '=
^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*=
', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^=
embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^e=
mpire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,=
.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder=
,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^fi=
refly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*',=
 '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', =
'^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*',=
 '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*',=
 '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.=
*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantpl=
us,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goco=
ntroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gp=
lus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', =
'^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustic=
s,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', =
'^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^=
hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hug=
sun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', =
'^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus=
,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*=
', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', =
'^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,=
.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insid=
e-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*'=
, '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondev=
ice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itia=
n,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^je=
dec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.=
*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep=
,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kin=
gdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe=
,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^lai=
rd,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*=
', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg=
,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lin=
colntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^l=
inksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^li=
teon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^long=
cheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^l=
uckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', =
'^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*=
', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.=
*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^med=
ion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellan=
ox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki=
,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcr=
ystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', =
'^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '=
^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^=
mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moo=
rtec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^=
mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mst=
ar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxi=
c,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^=
neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*=
', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhave=
n,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.=
*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^=
novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^=
nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic=
,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*=
', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalk=
elly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,=
.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech=
,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz=
,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.=
*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*=
', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip=
,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^pl=
antower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '=
^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell=
,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*=
', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pu=
lsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*',=
 '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^qu=
anta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^rasp=
berrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^rea=
ltek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '=
^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '=
^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^roc=
ktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapp=
lepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*=
', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', =
'^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seaga=
te,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^se=
nsirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicr=
o,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.=
*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,=
.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^sil=
abs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^s=
iliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,=
.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*',=
 '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,=
.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soci=
onext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*=
', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', =
'^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^te=
chnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.=
*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic=
,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thing=
yjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', =
'^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwi=
se,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*'=
, '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tro=
nsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*',=
 '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^ud=
oo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^=
uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '=
^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.=
*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vid=
eostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^=
vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^volt=
afield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,=
.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wet=
ek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.=
*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,=
.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^w=
obo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.=
*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera=
,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^y=
amaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '=
^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yu=
zukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*=
', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', =
'^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^as=
rock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel=
,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avne=
t,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blai=
ze,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*=
', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buff=
alo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.=
*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos=
,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*'=
, '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '=
^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,=
.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.=
*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cl=
oos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compa=
l,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^core=
river,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creati=
ve,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '=
^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*=
', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^=
deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^=
devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*=
', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^d=
lc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*',=
 '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dy=
naimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*=
', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '=
^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*=
', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^=
embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^e=
mpire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,=
.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder=
,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.=
*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,=
.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^fi=
refly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*',=
 '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', =
'^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*',=
 '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*',=
 '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.=
*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantpl=
us,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goco=
ntroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gp=
lus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', =
'^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustic=
s,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', =
'^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^=
hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hug=
sun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', =
'^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus=
,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*=
', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', =
'^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,=
.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insid=
e-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*'=
, '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondev=
ice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itia=
n,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^je=
dec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.=
*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep=
,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kin=
gdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe=
,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^lai=
rd,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*=
', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg=
,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lin=
colntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^l=
inksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^li=
teon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^long=
cheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^l=
uckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', =
'^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*=
', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.=
*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^med=
ion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellan=
ox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki=
,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcr=
ystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', =
'^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '=
^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^=
mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moo=
rtec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^=
mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mst=
ar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxi=
c,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^=
neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*=
', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhave=
n,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.=
*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^=
novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^=
nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic=
,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*=
', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalk=
elly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,=
.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech=
,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz=
,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.=
*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*=
', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip=
,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^pl=
antower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '=
^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell=
,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*=
', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pu=
lsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*',=
 '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^qu=
anta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^rasp=
berrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^rea=
ltek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '=
^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '=
^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^roc=
ktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapp=
lepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*=
', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', =
'^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seaga=
te,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^se=
nsirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicr=
o,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.=
*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,=
.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^sil=
abs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^s=
iliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,=
.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*',=
 '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,=
.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soci=
onext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*=
', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', =
'^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^te=
chnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.=
*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic=
,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thing=
yjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', =
'^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwi=
se,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*'=
, '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tro=
nsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*',=
 '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^ud=
oo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^=
uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '=
^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.=
*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vid=
eostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^=
vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^volt=
afield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,=
.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wet=
ek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.=
*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,=
.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^w=
obo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.=
*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera=
,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^y=
amaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '=
^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yu=
zukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*=
', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
s,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*',=
 '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^a=
srock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atme=
l,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buf=
falo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,=
.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^canino=
s,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*=
', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', =
'^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark=
,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,=
.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^c=
loos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^comp=
al,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^cor=
eriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creat=
ive,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', =
'^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.=
*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '=
^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '=
^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.=
*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^=
dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*'=
, '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^d=
ynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.=
*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', =
'^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.=
*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '=
^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^=
empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian=
,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^englede=
r,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,=
.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision=
,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '=
^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek=
,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^f=
irefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*'=
, '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*',=
 '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*'=
, '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*'=
, '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,=
.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantp=
lus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goc=
ontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^g=
plus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*',=
 '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacousti=
cs,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschm=
ann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplu=
s,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.=
*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*',=
 '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic=
,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^insi=
de-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*=
', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^ironde=
vice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^iti=
an,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^j=
edec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,=
.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoe=
p,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^ki=
ngdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^ko=
e,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^la=
ird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.=
*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^l=
g,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^li=
ncolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^=
linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^l=
iteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^lon=
gcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^=
luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*',=
 '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.=
*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,=
.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^me=
dion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*',=
 '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', =
'^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '=
^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^mo=
ortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '=
^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^ms=
tar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mx=
ic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '=
^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.=
*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhav=
en,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,=
.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '=
^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '=
^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceani=
c,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.=
*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opal=
kelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora=
,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetec=
h,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overki=
z,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,=
.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.=
*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochi=
p,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^p=
lantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', =
'^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwel=
l,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.=
*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^p=
ulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*'=
, '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^q=
uanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^ras=
pberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^re=
altek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', =
'^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', =
'^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^ro=
cktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseap=
plepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.=
*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',=
 '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seag=
ate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^s=
ensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmic=
ro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,=
.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens=
,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^si=
labs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^=
siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx=
,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*'=
, '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs=
,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^soc=
ionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophg=
o,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '=
^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*'=
, '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*',=
 '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*'=
, '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.=
*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.=
*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^vi=
deostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '=
^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vol=
tafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong=
,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^we=
tek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,=
.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen=
,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^=
wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,=
.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xipher=
a,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^=
yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', =
'^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^y=
uzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.=
*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
