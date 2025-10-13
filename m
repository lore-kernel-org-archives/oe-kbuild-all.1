Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE626FDA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358445; cv=none; b=KalkApb7KzU/UGnwESqhPtr1PAGqVsdP9lVc3nLI+D5m+nhIsjwcz+vebkG7MYLFrFdOuZN2FSRSQUybWUNx9KPWTwnLcJ8u9aISguRrgVvTT9WVwAjmXMPl0GIiW7OIdJ4jVxjBqQ18U7E/23/m/DGItk2DtID1E/MVEUVG+yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358445; c=relaxed/simple;
	bh=b6KZ5fYpBiRGov6N6TkSZun7Qd8Tudn3ZY5mmitihD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uh+NvhM1ULX9JxVSwBG8qxjU2yLZZivdafRlLJD4gkeS+ALK5o/fAFavh8fppMANU/TxFaax9kQ+6TSUiL/+QRJ0Fq9XkV+lTFeykY0Gg6Z8KJYYmSb65Go/kHfDHK8/zMMunQNX671RRpeIjRJtELjPUJ4X6+bt0kYDJGtznCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ7aMM7L; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJ7aMM7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358444; x=1791894444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6KZ5fYpBiRGov6N6TkSZun7Qd8Tudn3ZY5mmitihD8=;
  b=GJ7aMM7Lr8Wy4KRzE+77rihTXqsMyYrP63YgY/Lf+Js55NgyhTY6DuwL
   xLFN+2knRqi3Vf+4e/xp/shx7737BHsx/Vu3pt/LDrniV2QJxDtDgcjIo
   iLU6DS79ZTIL3IhoQ5g8wP87eyuxkihhOPxijqBhHYG8JwViTONDLaSq3
   2dz0LwW6zVl4rRSBfT5tQQDgLcp8zisqtI/tqslz6BFTuOpTxz823tQIU
   nFLX102+W9F8d4hFgqNJC6utNJsRP1VgQXbTweVuHJxYieNUgdMKV//YK
   K4rwnPp3rtdCntwG7vIsKEzNYEawvtlQIKpjpC0tC6um7JAjK6+iWk4fi
   w==;
X-CSE-ConnectionGUID: j8Z3VNnjTbWiBfTFHbF64w==
X-CSE-MsgGUID: GZsQFzLZSAuR2SevPMot9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62528678"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62528678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:19 -0700
X-CSE-ConnectionGUID: l71C5AruTCqzP3krJtBCNw==
X-CSE-MsgGUID: uxxM7fkxSGGOANnGbWt2CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186001673"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008sF-20Yl;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:48 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 105/110]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning
 (pci_device_reg): Failed prerequisite 'reg_format'
Message-ID: <202510121830.e2i1gArk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   936e993c16c5c695eb2ce063a5a11f122a580727
commit: 567342ac6d5d63d56875cf9ead8d3aebd3b06fa4 [105/110] dts: try to get lan-phy working
config: arm64-randconfig-2051-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121830.e2i1gArk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121830.e2i1gArk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121830.e2i1gArk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:136.4-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:142.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:150.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:134.21-155.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:134.21-155.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:141.28-147.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:141.28-147.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:149.28-154.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:149.28-154.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
