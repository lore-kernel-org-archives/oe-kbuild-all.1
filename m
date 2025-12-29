Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65F1F3BA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767038787; cv=none; b=gyHyhKuv1gMMT0v7jrhJPkz9g0Yr52rSm8praRkRKYedO7cKvzOkd73xs0wr6ILp6u0Ndan6cubgEQIbFYN0ht0/3LzNRYi+ECQRVB2JDS633cAEmM9bukZle4jUNAvvJCZYqYCRb+dDqP/cJ35FSosAtTCM7KsMcbFHQz7yWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767038787; c=relaxed/simple;
	bh=BTm04JsRLIRLAr6vQx8iEv9EHkRjSn0Lmmdfo6V4wb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgDO/zvjYwEtrkMg8mE7V8cTSyJeCbvCE2shhsD6M/qI2K3wEO0/1eZ/vCluzsVJWY0nu2pQGB0/g+PwciLJpTCr2oRl1ePNTZhNpr26PJxo9aBSL9ysROI3+YC9dFbM+u1btd98BSLhy6lb2Bk9eVba5EfGZ4O8TFe5V+OvMck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUiNjwNA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUiNjwNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767038774; x=1798574774;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BTm04JsRLIRLAr6vQx8iEv9EHkRjSn0Lmmdfo6V4wb8=;
  b=PUiNjwNAAFmJbX8dPaAkasdFn0YI7w9ku2Crsr5ZtqD021lIG/HkKKQn
   jQheK1tf+Xv1FXJ9ZA+R17UsNb+Pgh+eF/Qhd3pfYqyiXwI07HSW+n7A8
   cO+RGEg2xxV8MwFBGNGuGPwBPjjKYeKQIzdNg8mbAu6+3WtazXE0/OaDt
   NpwHZXbZ95LL/0/I0F3p/3rAVTT3Qi6bsD7LgWTq3iTvb7uKmkoIKD/YO
   xC9IOD6N54CjvGsJunxIqQfCEsbaQZGyuNv8J4gKS16AGO7xuhvUZm5Ec
   md9j0VyZkp6uLcvfCBcEFus+LmTmr86bOB6bFqOZ1whO6vmmhEQ6IgaxN
   A==;
X-CSE-ConnectionGUID: Q3xcnOMSSr2IkzabF4AJ4Q==
X-CSE-MsgGUID: EPsKTbc3SqqcI4olzMm8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68535084"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="68535084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 12:06:10 -0800
X-CSE-ConnectionGUID: txsoc4ooRQq9CaEUYUwOIw==
X-CSE-MsgGUID: /Ce5NxlzS+CP9EOUNC7ISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200969215"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Dec 2025 12:06:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaJVF-000000007oe-12Vh;
	Mon, 29 Dec 2025 20:06:05 +0000
Date: Mon, 29 Dec 2025 21:05:44 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-jumbo 105/115]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /
 (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
Message-ID: <202512292113.bQt4blZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-jumbo
head:   a3207a3837942ec02fd58f5aa8a2c24a82053f85
commit: e1c30b9d41043d0205ee9bf797aea8f2e18ce0a4 [105/115] arm64: dts: buil=
d overlays for bpi-r4-lite emmc/sd + nand/nor
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/arc=
hive/20251229/202512292113.bQt4blZ7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251229/202512292113.bQt4blZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512292113.bQt4blZ7-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pinctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'groups' does=
 not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 pinctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'pins' is a r=
equired property
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['medi=
atek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb:=
 /soc/trng@1020f000: failed to match any schema with compatible: ['mediatek=
,mt7987-rng']
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
89-efuse']
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
 crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' cond=
itional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
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
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
work,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedv=
ision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt=
,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^ame=
diatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^a=
ms,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^a=
nlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '=
^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^a=
rcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus=
,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*=
', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*',=
 '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,=
=2E*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '=
^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '=
^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmob=
i,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '=
^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '=
^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^ca=
scoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*=
', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefre=
e,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^c=
hrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,=
=2E*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines=
,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', =
'^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*'=
, '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,=
=2E*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*'=
, '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic=
,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^=
dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,=
=2E*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', =
'^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', =
'^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', =
'^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.=
*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*',=
 '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*=
', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*',=
 '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^em=
best,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*=
', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*',=
 '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', =
'^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^=
eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^=
excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^=
fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^=
feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^fli=
pkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '=
^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^f=
ujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', =
'^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^ge=
f,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*',=
 '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.=
*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.=
*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hon=
eywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^=
htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*'=
, '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i=
2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*'=
, '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,=
=2E*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxto=
r,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^=
mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^m=
ellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^m=
eraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^mi=
crocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,=
=2E*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand=
,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,=
=2E*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.=
*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^mox=
a,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.=
*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.=
*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^ne=
c,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^ne=
tlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', =
'^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '=
^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothin=
g,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numony=
x,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', =
'^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', =
'^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*'=
, '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^ope=
npandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^=
orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', =
'^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '=
^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^p=
ericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '=
^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,=
=2E*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
=2E*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^r=
da,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rer=
vision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ric=
oh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktec=
h,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi=
,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '=
^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^sc=
hneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.=
*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensir=
ion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*=
', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', =
'^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*',=
 '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,=
=2E*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^sil=
iconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*=
', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '=
^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*=
', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socion=
ext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.=
*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^sp=
inalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '=
^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^=
starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '=
^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*',=
 '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*',=
 '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^=
tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^tech=
nexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*'=
, '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.=
*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyj=
p,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^=
tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise=
,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', =
'^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^trons=
mart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u=
-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispa=
ce,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uni=
west,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,=
=2E*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*',=
 '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', =
'^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '=
^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^=
vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*=
', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexl=
er,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi=
,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar=
,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wol=
fvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*=
', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.=
*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^y=
es-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yo=
nes-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^=
zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.=
*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pinctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'groups' does =
not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
pinctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'pins' is a re=
quired property
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/boottrap@1001f6f0: failed to match any schema with compatible: ['media=
tek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: =
/soc/trng@1020f000: failed to match any schema with compatible: ['mediatek,=
mt7987-rng']
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
89-efuse']
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
crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
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
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
inctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'groups' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: p=
inctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'pins' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediat=
ek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /=
soc/trng@1020f000: failed to match any schema with compatible: ['mediatek,m=
t7987-rng']
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
89-efuse']
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
rypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' condit=
ional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
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
=2E*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
=2E*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
=2E*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
=2E*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
--
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pi=
nctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'groups' does no=
t match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pi=
nctrl@1001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'pins' is a requ=
ired property
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediate=
k,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /s=
oc/trng@1020f000: failed to match any schema with compatible: ['mediatek,mt=
7987-rng']
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
89-efuse']
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
ypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' conditi=
onal failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
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
=2E*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
=2E*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
=2E*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
=2E*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|px=
a-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st=
-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^=
9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9=
#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb=
,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '=
^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anl=
ogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^a=
ptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arc=
x,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
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
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
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
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
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
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
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
=2E*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', =
'^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', =
'^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,=
=2E*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*',=
 '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-ne=
twork,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^allied=
vision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^al=
t,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^am=
ediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', =
'^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^=
arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeu=
s,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fai=
rphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^fei=
xin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipka=
rt,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fr=
eebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fuji=
tsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^g=
ateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.=
*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^=
geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,=
=2E*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goo=
dix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', =
'^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^=
hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*=
', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^hone=
ywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^h=
tc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*',=
 '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2=
se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,=
=2E*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '=
^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^ji=
anda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^l=
inksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^=
liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.=
*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*=
', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec=
,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor=
,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^m=
ediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^me=
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
=2E*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*'=
, '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', =
'^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*',=
 '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,=
=2E*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
=2E*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-bl=
ox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,=
=2E*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.=
*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^=
vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^v=
irtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vi=
vante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot=
,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', =
'^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,=
=2E*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,=
=2E*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winsta=
r,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wo=
lfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.=
*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,=
=2E*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
