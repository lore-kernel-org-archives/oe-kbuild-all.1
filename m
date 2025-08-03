Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE525A659
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 06:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754201906; cv=none; b=pjf9+lA2MMk74a1zUUCanZkbwCO3UsHPi3dM3X1caBVKAAokhCnbMVpwmQK0PJSMH95g6pJlwpsKpdHqPqo425sw1/zThgX1fbXJ+AR5Q/Bxw+hQ84blrQUXst9LeDntTBbil3xbZpMFtTWr0EfnnXyOIHTD3Tr9+uC98KIIcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754201906; c=relaxed/simple;
	bh=lfPcT5eSCApML8n/eJ3YTqryX1eMn7XueJ+Is45dnl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvX36FVgV6vVLQJpUAUOjD3K5cfdkss0PkFv1r4ZO/a6qu4+3NxNEcGKKcBx0blQPNzvemge7aAd1LQL2vUVhzoPEu3dbmv9XXTw8LblOBVmx7Z59TrUtnADYqUkHC0DIH9P4CW2ysAqyLD7QX/ZcjW1EJYU5XAM7uTa5ZaDqrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oyea8fQy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oyea8fQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754201904; x=1785737904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfPcT5eSCApML8n/eJ3YTqryX1eMn7XueJ+Is45dnl4=;
  b=Oyea8fQyApBrJQjusjTNg1DGwYln2OSOqIsB946y+5Lmhq80e4xqwWxd
   /ifUo+WPGI1iKoXr5vOCqZN0CujLduICTPf+kRDGnF+ljOYfErk/nPY+/
   G0xyhvGF0MIYfw/6DxLnjBYJjXhugfH2kRXgPfuouU9u9K91ZQfvlDsQc
   q5MijrRgsYPF3SKsHLf88YfNgR9kSGDnA7Mx+GE2Co23eSi2URaWu158v
   QhPMNbdfQAcUTxmn6pGtsiz8Ewm7XQJjbvKYHf+hrbw+0R6daRa045Kgq
   z+4QPWUIfw//YZ1i/8vSlT9Ffl9cIXLjn3VkC0VZGSx7Rberso83TH/7X
   g==;
X-CSE-ConnectionGUID: pGWMDAf1QJiLERGQGwbsNg==
X-CSE-MsgGUID: dqAf6olMTsefnjQCrHFTlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="79043705"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79043705"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 23:18:23 -0700
X-CSE-ConnectionGUID: d4TYU7MDQkSCv5AKBpvEKA==
X-CSE-MsgGUID: w+pDz0a8RFCN3ApSplt9mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164233189"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 02 Aug 2025 23:18:22 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiS31-0001Z7-1d;
	Sun, 03 Aug 2025 06:18:19 +0000
Date: Sun, 3 Aug 2025 08:18:10 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 52/62]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:94.9-96.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <202508030854.Xgc9Zri7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   b0f90216206d37cda5e6c378a69959bc658c0969
commit: 5e4e979c302e83a06a5ca9ce9b163800609eb2f0 [52/62] dts64: mt7988: r4pro: misc fixes
config: arm64-randconfig-2051-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030854.Xgc9Zri7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030854.Xgc9Zri7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030854.Xgc9Zri7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:94.9-96.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:580.14-585.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: node name is not "pci" or "pcie"
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:580.14-585.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: missing ranges for PCI bridge (or not a bridge)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:580.14-585.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: incorrect #address-cells for PCI bridge
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:580.14-585.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: incorrect #size-cells for PCI bridge
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
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
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: mt7996@0,0 (mediatek,mt76): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@2: failed to match any schema with compatible: ['mediatek,eth-mux']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: gpio-keys (gpio-keys): 'reset', 'wps' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

vim +94 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts

850900d4b4e92f Frank Wunderlich 2025-06-16  @94  	memory {
850900d4b4e92f Frank Wunderlich 2025-06-16   95  		reg = <0x00 0x40000000 0x00 0x10000000>;
850900d4b4e92f Frank Wunderlich 2025-06-16   96  	};
850900d4b4e92f Frank Wunderlich 2025-06-16   97  	/* SFP1 cage (LAN) */
850900d4b4e92f Frank Wunderlich 2025-06-16   98  	sfp1: sfp1 {
850900d4b4e92f Frank Wunderlich 2025-06-16   99  		compatible = "sff,sfp";
850900d4b4e92f Frank Wunderlich 2025-06-16  100  		i2c-bus = <&imux1_gpio>;
850900d4b4e92f Frank Wunderlich 2025-06-16  101  		los-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
850900d4b4e92f Frank Wunderlich 2025-06-16  102  		mod-def0-gpios = <&pio 4 GPIO_ACTIVE_LOW>;
850900d4b4e92f Frank Wunderlich 2025-06-16  103  		tx-disable-gpios = <&pio 21 GPIO_ACTIVE_HIGH>;
850900d4b4e92f Frank Wunderlich 2025-06-16  104  		maximum-power-milliwatt = <3000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  105  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  106  	/* SFP2 cage (WAN) */
850900d4b4e92f Frank Wunderlich 2025-06-16  107  	sfp2: sfp2 {
850900d4b4e92f Frank Wunderlich 2025-06-16  108  		compatible = "sff,sfp";
850900d4b4e92f Frank Wunderlich 2025-06-16  109  		i2c-bus = <&imux2_sfp2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  110  		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
850900d4b4e92f Frank Wunderlich 2025-06-16  111  		mod-def0-gpios = <&pio 1 GPIO_ACTIVE_LOW>;
850900d4b4e92f Frank Wunderlich 2025-06-16  112  		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
850900d4b4e92f Frank Wunderlich 2025-06-16  113  		maximum-power-milliwatt = <3000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  114  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  115  };
850900d4b4e92f Frank Wunderlich 2025-06-16  116  &eth {
850900d4b4e92f Frank Wunderlich 2025-06-16  117  	pinctrl-0 = <&mdio0_pins>;
850900d4b4e92f Frank Wunderlich 2025-06-16  118  	pinctrl-names = "default";
850900d4b4e92f Frank Wunderlich 2025-06-16  119  	status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  120  	mux: mux-bus {
5e4e979c302e83 Frank Wunderlich 2025-06-16  121  		#address-cells = <1>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  122  		#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  123  		mux1: ethernet-mux@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  124  			compatible = "mediatek,eth-mux";
850900d4b4e92f Frank Wunderlich 2025-06-16  125  			reg = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  126  			chan-sel-gpios = <&pio 3 GPIO_ACTIVE_HIGH>;
850900d4b4e92f Frank Wunderlich 2025-06-16  127  			mod-def0-gpios = <&pio 1 GPIO_ACTIVE_LOW>;
850900d4b4e92f Frank Wunderlich 2025-06-16  128  			sfp-present-channel = <1>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  129  			#address-cells = <1>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  130  			#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  131  			channel_10: channel@0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  132  				reg = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  133  				phy-mode = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  134  				phy-connection-type = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  135  				phy-handle = <&phy28>;
850900d4b4e92f Frank Wunderlich 2025-06-16  136  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  137  			channel_11: channel@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  138  				reg = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  139  				phy-mode = "10gbase-r";
850900d4b4e92f Frank Wunderlich 2025-06-16  140  				phy-connection-type = "10gbase-r";
850900d4b4e92f Frank Wunderlich 2025-06-16  141  				managed = "in-band-status";
850900d4b4e92f Frank Wunderlich 2025-06-16  142  				sfp = <&sfp2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  143  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  144  		};
850900d4b4e92f Frank Wunderlich 2025-06-16  145  		mux2: ethernet-mux@2 {
850900d4b4e92f Frank Wunderlich 2025-06-16  146  			compatible = "mediatek,eth-mux";
850900d4b4e92f Frank Wunderlich 2025-06-16  147  			reg = <2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  148  			chan-sel-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
850900d4b4e92f Frank Wunderlich 2025-06-16  149  			mod-def0-gpios = <&pio 4 GPIO_ACTIVE_LOW>;
850900d4b4e92f Frank Wunderlich 2025-06-16  150  			sfp-present-channel = <0>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  151  			#address-cells = <1>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  152  			#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  153  			channel_20: channel@0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  154  				reg = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  155  				phy-mode = "10gbase-r";
850900d4b4e92f Frank Wunderlich 2025-06-16  156  				phy-connection-type = "10gbase-r";
850900d4b4e92f Frank Wunderlich 2025-06-16  157  				managed = "in-band-status";
850900d4b4e92f Frank Wunderlich 2025-06-16  158  				sfp = <&sfp1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  159  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  160  			channel_21: channel@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  161  				reg = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  162  				phy-mode = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  163  				phy-connection-type = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  164  				phy-handle = <&phy24>;
850900d4b4e92f Frank Wunderlich 2025-06-16  165  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  166  		};
850900d4b4e92f Frank Wunderlich 2025-06-16  167  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  168  };
850900d4b4e92f Frank Wunderlich 2025-06-16  169  &gmac0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  170  	status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  171  	nvmem-cell-names = "mac-address";
850900d4b4e92f Frank Wunderlich 2025-06-16  172  	nvmem-cells = <&gmac0_mac>;
850900d4b4e92f Frank Wunderlich 2025-06-16  173  };
850900d4b4e92f Frank Wunderlich 2025-06-16  174  &gmac1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  175  	phy-mode = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  176  	phy-connection-type = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  177  	phy = <&phy28>;
850900d4b4e92f Frank Wunderlich 2025-06-16  178  	nvmem-cell-names = "mac-address";
850900d4b4e92f Frank Wunderlich 2025-06-16  179  	nvmem-cells = <&gmac1_mac>;
850900d4b4e92f Frank Wunderlich 2025-06-16  180  	status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  181  };
850900d4b4e92f Frank Wunderlich 2025-06-16  182  &gmac2 {
850900d4b4e92f Frank Wunderlich 2025-06-16  183  	phy-mode = "10gbase-r";
850900d4b4e92f Frank Wunderlich 2025-06-16  184  	phy-connection-type = "10gbase-r";
850900d4b4e92f Frank Wunderlich 2025-06-16  185  	nvmem-cell-names = "mac-address";
850900d4b4e92f Frank Wunderlich 2025-06-16  186  	nvmem-cells = <&gmac2_mac>;
850900d4b4e92f Frank Wunderlich 2025-06-16  187  	status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  188  	fixed-link {
850900d4b4e92f Frank Wunderlich 2025-06-16  189  		speed = <10000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  190  		full-duplex;
850900d4b4e92f Frank Wunderlich 2025-06-16  191  		pause;
850900d4b4e92f Frank Wunderlich 2025-06-16  192  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  193  };
850900d4b4e92f Frank Wunderlich 2025-06-16  194  &int_2p5g_phy {
850900d4b4e92f Frank Wunderlich 2025-06-16  195  	status = "disabled";
850900d4b4e92f Frank Wunderlich 2025-06-16  196  };
850900d4b4e92f Frank Wunderlich 2025-06-16  197  &mdio_bus {
850900d4b4e92f Frank Wunderlich 2025-06-16  198  	/* external Airoha AN8831X is connected to Mxl 2.5G switch */
850900d4b4e92f Frank Wunderlich 2025-06-16  199  	phy24: ethernet-phy@24 {
850900d4b4e92f Frank Wunderlich 2025-06-16  200  		reg = <24>;
850900d4b4e92f Frank Wunderlich 2025-06-16  201  		compatible = "ethernet-phy-ieee802.3-c45";
850900d4b4e92f Frank Wunderlich 2025-06-16  202  		reset-gpios = <&pca9555 12 GPIO_ACTIVE_LOW>;
850900d4b4e92f Frank Wunderlich 2025-06-16  203  		reset-assert-us = <200000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  204  		reset-deassert-us = <350000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  205  		firmware-name = "as21x1x_fw.bin";
850900d4b4e92f Frank Wunderlich 2025-06-16  206  		leds {
850900d4b4e92f Frank Wunderlich 2025-06-16  207  			#address-cells = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  208  			#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  209  			phy24_led0: an8831x_phy24_led0@0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  210  				reg = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  211  				linux,default-trigger = "netdev";
850900d4b4e92f Frank Wunderlich 2025-06-16  212  				active-high;
850900d4b4e92f Frank Wunderlich 2025-06-16  213  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  214  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  215  			phy24_led1: an8831x_phy24_led1@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  216  				reg = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  217  				linux,default-trigger = "netdev";
850900d4b4e92f Frank Wunderlich 2025-06-16  218  				active-high;
850900d4b4e92f Frank Wunderlich 2025-06-16  219  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  220  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  221  		};
850900d4b4e92f Frank Wunderlich 2025-06-16  222  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  223  	/* external Airoha AN8831X */
850900d4b4e92f Frank Wunderlich 2025-06-16  224  	phy28: ethernet-phy@28 {
850900d4b4e92f Frank Wunderlich 2025-06-16  225  		reg = <28>;
850900d4b4e92f Frank Wunderlich 2025-06-16  226  		compatible = "ethernet-phy-ieee802.3-c45";
850900d4b4e92f Frank Wunderlich 2025-06-16  227  		reset-gpios = <&pca9555 13 GPIO_ACTIVE_LOW>;
850900d4b4e92f Frank Wunderlich 2025-06-16  228  		reset-assert-us = <200000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  229  		reset-deassert-us = <350000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  230  		firmware-name = "as21x1x_fw.bin";
850900d4b4e92f Frank Wunderlich 2025-06-16  231  		leds {
850900d4b4e92f Frank Wunderlich 2025-06-16  232  			#address-cells = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  233  			#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  234  			phy28_led0: an8831x_phy28_led0@0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  235  				reg = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  236  				linux,default-trigger = "netdev";
850900d4b4e92f Frank Wunderlich 2025-06-16  237  				active-high;
850900d4b4e92f Frank Wunderlich 2025-06-16  238  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  239  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  240  			phy28_led1: an8831x_phy28_led1@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  241  				reg = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  242  				linux,default-trigger = "netdev";
850900d4b4e92f Frank Wunderlich 2025-06-16  243  				active-high;
850900d4b4e92f Frank Wunderlich 2025-06-16  244  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  245  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  246  		};
850900d4b4e92f Frank Wunderlich 2025-06-16  247  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  248  	switch16: switch@16 {
850900d4b4e92f Frank Wunderlich 2025-06-16  249  		compatible = "mxl,86252";
850900d4b4e92f Frank Wunderlich 2025-06-16  250  		reg = <16>;
850900d4b4e92f Frank Wunderlich 2025-06-16  251  		dsa,member = <0 0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  252  		status = "disabled";
850900d4b4e92f Frank Wunderlich 2025-06-16  253  		ports {
5e4e979c302e83 Frank Wunderlich 2025-06-16  254  			#address-cells = <1>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  255  			#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  256  			port0: port@0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  257  				reg = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  258  				label = "mxl_lan0";
850900d4b4e92f Frank Wunderlich 2025-06-16  259  				phy-handle = <&switchphy0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  260  				phy-mode = "internal";
850900d4b4e92f Frank Wunderlich 2025-06-16  261  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  262  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  263  			port1: port@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  264  				reg = <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  265  				label = "mxl_lan1";
850900d4b4e92f Frank Wunderlich 2025-06-16  266  				phy-handle = <&switchphy1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  267  				phy-mode = "internal";
850900d4b4e92f Frank Wunderlich 2025-06-16  268  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  269  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  270  			port2: port@2 {
850900d4b4e92f Frank Wunderlich 2025-06-16  271  				reg = <2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  272  				label = "mxl_lan2";
850900d4b4e92f Frank Wunderlich 2025-06-16  273  				phy-handle = <&switchphy2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  274  				phy-mode = "internal";
850900d4b4e92f Frank Wunderlich 2025-06-16  275  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  276  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  277  			port3: port@3 {
850900d4b4e92f Frank Wunderlich 2025-06-16  278  				reg = <3>;
850900d4b4e92f Frank Wunderlich 2025-06-16  279  				label = "mxl_lan3";
850900d4b4e92f Frank Wunderlich 2025-06-16  280  				phy-handle = <&switchphy3>;
850900d4b4e92f Frank Wunderlich 2025-06-16  281  				phy-mode = "internal";
850900d4b4e92f Frank Wunderlich 2025-06-16  282  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  283  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  284  			port4: port@4 {
850900d4b4e92f Frank Wunderlich 2025-06-16  285  				reg = <4>;
850900d4b4e92f Frank Wunderlich 2025-06-16  286  				label = "mxl_lan4";
850900d4b4e92f Frank Wunderlich 2025-06-16  287  				phy-handle = <&switchphy4>;
850900d4b4e92f Frank Wunderlich 2025-06-16  288  				phy-mode = "internal";
850900d4b4e92f Frank Wunderlich 2025-06-16  289  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  290  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  291  			port12: port@12 {
850900d4b4e92f Frank Wunderlich 2025-06-16  292  				reg = <12>;
850900d4b4e92f Frank Wunderlich 2025-06-16  293  				label = "mxl_lan12";
850900d4b4e92f Frank Wunderlich 2025-06-16  294  				phy-mode = "xfi";
850900d4b4e92f Frank Wunderlich 2025-06-16  295  				status = "okay";
850900d4b4e92f Frank Wunderlich 2025-06-16  296  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  297  			port8: port@8 {
850900d4b4e92f Frank Wunderlich 2025-06-16  298  				reg = <8>;
850900d4b4e92f Frank Wunderlich 2025-06-16  299  				label = "cpu";
850900d4b4e92f Frank Wunderlich 2025-06-16  300  				phy-mode = "usxgmii";
850900d4b4e92f Frank Wunderlich 2025-06-16  301  				ethernet = <&gmac2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  302  				dsa-tag-protocol = "mxl862_8021q";
850900d4b4e92f Frank Wunderlich 2025-06-16  303  				fixed-link {
850900d4b4e92f Frank Wunderlich 2025-06-16  304  					speed = <10000>;
850900d4b4e92f Frank Wunderlich 2025-06-16  305  					full-duplex;
850900d4b4e92f Frank Wunderlich 2025-06-16  306  				};
850900d4b4e92f Frank Wunderlich 2025-06-16  307  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  308  		};
850900d4b4e92f Frank Wunderlich 2025-06-16  309  		mdio {
5e4e979c302e83 Frank Wunderlich 2025-06-16  310  			#address-cells = <1>;
5e4e979c302e83 Frank Wunderlich 2025-06-16  311  			#size-cells = <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  312  			switchphy0:switchphy@0 {
850900d4b4e92f Frank Wunderlich 2025-06-16  313  				reg= <0>;
850900d4b4e92f Frank Wunderlich 2025-06-16  314  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  315  			switchphy1:switchphy@1 {
850900d4b4e92f Frank Wunderlich 2025-06-16  316  				reg= <1>;
850900d4b4e92f Frank Wunderlich 2025-06-16  317  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  318  			switchphy2:switchphy@2 {
850900d4b4e92f Frank Wunderlich 2025-06-16  319  				reg= <2>;
850900d4b4e92f Frank Wunderlich 2025-06-16  320  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  321  			switchphy3:switchphy@3 {
850900d4b4e92f Frank Wunderlich 2025-06-16  322  				reg= <3>;
850900d4b4e92f Frank Wunderlich 2025-06-16  323  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  324  			switchphy4:switchphy@4 {
850900d4b4e92f Frank Wunderlich 2025-06-16  325  				reg= <4>;
850900d4b4e92f Frank Wunderlich 2025-06-16  326  			};
850900d4b4e92f Frank Wunderlich 2025-06-16  327  		};
850900d4b4e92f Frank Wunderlich 2025-06-16  328  	};
850900d4b4e92f Frank Wunderlich 2025-06-16  329  };
5e4e979c302e83 Frank Wunderlich 2025-06-16  330  

:::::: The code at line 94 was first introduced by commit
:::::: 850900d4b4e92f66c16b99e89f3485486406758b arm64: dts: mt7988: add R4-Pro dts from MTK SDK

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
