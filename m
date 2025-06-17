Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DCB2CCC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125512; cv=none; b=jckR0GRrSTcxhhPvlnekqAUY7So6ga4uw96GAZ29LF1Ymrl6h2zia5VCqFMOu/DrF7zqtvkRttN7o+LHHhx+xsDWikK/nK/Z3Xf9T+Mpwg1rMxXELRflHcby2MQ2qGMc3Un4x7xW07vfZvuxVmSlwvbC+FuC7RvY9IdaC8laJMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125512; c=relaxed/simple;
	bh=ot3MsIw3TS5TkX4/6+PT0Dux7rg4fS4uB2BwzbfOjks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1WuTRhHVWRQ7sfazWnppVyPYR3qlJimved0ezYmOvHA6Wijtl5FCbv/aWDU1DT7P0SzHYBqhox41dQXi1XJ/Ab3LqD0wuV8H18y5D/cnN/c3P2ZOLCF9rLqrthQKWz4IZ8ITCVWMheTSqFr97bblL456nPr5TezwIo1l8U3IjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNlrd0G5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNlrd0G5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750125510; x=1781661510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ot3MsIw3TS5TkX4/6+PT0Dux7rg4fS4uB2BwzbfOjks=;
  b=fNlrd0G5yyPT8lX5wjkm3NRDv/xFicZorksc8hOjMfNPwRilbRF8HQPV
   gcMgMphdWzRS1Jr+5IhQEWCt5LERUAET/1IGRzT7eCYEwPApV0iExsN9z
   54DuLYxHwQbgj92BsdsdYqEQMao3Ttt/jIUw0qmoWYDGIDG/u2cI6YnHy
   UcPGRtJGak13t8FZNRf+fFteL93/dBf07WOZGi/dyWRPkeK8hyZEpKVBK
   zx/PlDj3WkzY2QvALB0HzbyFkYVkhX5bdxsklrY+uIAxR4mKIDvb4aWup
   w/0Q45lhvpEp+17B+RrmI5vFGBtFcmrPjsbLBTal7a36LmYcZsyfUx1Nj
   A==;
X-CSE-ConnectionGUID: sqUKWwdHSgyOO6Xm3owDbg==
X-CSE-MsgGUID: RHlrjqwIQUqND8qOUdzX7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62935697"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62935697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:58:30 -0700
X-CSE-ConnectionGUID: VHSqE1BuTlScH4Qcd9+P4A==
X-CSE-MsgGUID: 9XG+uRlERSOAXhha3J5pyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="179507819"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2025 18:58:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRLak-000FVI-0k;
	Tue, 17 Jun 2025 01:58:26 +0000
Date: Tue, 17 Jun 2025 09:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 53/53]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /
 (bananapi,bpi-r4-pro): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202506170950.NjOMYc45-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   de2eef5af7055f0bc1f2c29e4025169aa41126ae
commit: abfdfd2323f75f5893aeb593f5164a4a05558d9d [53/53] dts64: r4pro: fix build-errors (take fan from r4) but still warnings (reg_format/default_addr_size)
config: arm64-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170950.NjOMYc45-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170950.NjOMYc45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170950.NjOMYc45-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:133.26-139.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:133.26-139.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:141.24-160.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:141.24-160.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:147.26-153.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:147.26-153.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:154.26-159.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:154.26-159.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: / (bananapi,bpi-r4-pro): compatible: 'oneOf' conditional failed, one must be fixed:
   	['bananapi,bpi-r4-pro', 'mediatek,mt7988a'] is too short
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt2701-evb']
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt2712-evb']
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt6580-evbp1']
   	'bananapi,bpi-r4-pro' is not one of ['prestigio,pmt5008-3g']
   	'bananapi,bpi-r4-pro' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt6592-evb']
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt6755-evb']
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt6765-evb']
   	'bananapi,bpi-r4-pro' is not one of ['mediatek,mt6779-evb']
--
   	'google,tomato' was expected
   	'google,tomato-rev3' was expected
   	'google,dojo-sku5' was expected
   	'mediatek,mt8195' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8370' was expected
   	'mediatek,mt8390' was expected
   	'mediatek,mt8395' was expected
   	'mediatek,mt8516' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-pro', 'mediatek,mt7988a']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: / (bananapi,bpi-r4-pro): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: / (bananapi,bpi-r4-pro): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: i2c-switch@70 (nxp,pca9545): $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: i2c-switch@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: eeprom@51 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: spi_nand@0 (spi-nand): $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: spi_nand@0 (spi-nand): Unevaluated properties are not allowed ('partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: mt7996@0,0:compatible: ['mediatek,mt76'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: mt7996@0,0 (mediatek,mt76): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@2: failed to match any schema with compatible: ['mediatek,eth-mux']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: gpio-keys (gpio-keys): 'reset', 'wps' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
