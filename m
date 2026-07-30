Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349043F0A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427061; cv=none; b=YBhRn9io33Xaf61z6XFVoFJRHg7ZtgJ0NI+ptO010w0eXhAC2GBRyou1PogCEf3KpKFtHx6ndQTv2ZqmaWTpOOExQfz4baT0BDCHd8AciWHRvhKCaijESV8jwVblJczJU1NZuDXCcbGrTY8j01F5r7R4JuoMonGy/hUBmCXI7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427061; c=relaxed/simple;
	bh=BCcZB4BZTvwoNskjCfKwK1foa9R1eBXlh3HaWWIwb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W61ST4g+x3NE/b22+veMRiIVZstNB0UPRPG6t1bAiE3c/o3CSNeK6wriI5bCmp/Slkmb/ovBr8fLKVvVJYDLOrFUb3lzibej9KEs3EwcZ8QDNmEQuDaHE/9HiqmXo4XSglf9mKnMCF23Uas/YXOiUutFWou0e8GEQGSUAqhYWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DueWatc5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DueWatc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785427059; x=1816963059;
  h=date:from:to:cc:subject:message-id;
  bh=BCcZB4BZTvwoNskjCfKwK1foa9R1eBXlh3HaWWIwb0Q=;
  b=DueWatc50SIjf/qUsq5fOjYZsJNczGmH6tSJukhBdy0Dmyr4Pjjv8ZzI
   nO0uClEKDZSBlx6OKIBn1zv5gzsmauHe7B0jOsEThtEgNa7QXgIb/4loi
   EfjkL8tBl6ujM6B1QS9piW8+jQIsnfKwr9mKUfjgRiHBU6ltzEOUT0I7I
   BBtEB1WZ7iSW7Yq8UzHzGtuRxkKoy0DOXm2YPzkXa+qdIyFREjP3U/avL
   /bWrYgXi/nvnRtmSjn9NsiN38VZjPnGtj1R3BgxBCGiUecKzw0EHwV3A9
   +h+xiHjn++yERldl+CKakIphCzptRl5OutpkM7eBGBDy1i2EJGQSzmPTU
   A==;
X-CSE-ConnectionGUID: KoDBg88RRkuxSJjJa83+Vw==
X-CSE-MsgGUID: 5BaNjy8UTvaNlGKPV53HGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85175995"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85175995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 08:57:38 -0700
X-CSE-ConnectionGUID: mgnJW7ZaTmGvBqUBi2g7AQ==
X-CSE-MsgGUID: bkaPHHYGSX23fCxJiHyhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="298531125"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 08:57:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpT8X-000000002PK-3MDQ;
	Thu, 30 Jul 2026 15:57:33 +0000
Date: Thu, 30 Jul 2026 17:57:32 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 86/168]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not
 match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
Message-ID: <202607301747.qLwp6YsA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   1953c4d64c0da95dd5833d59a20a9f1f456fec31
commit: ff3018942adc310b90b7b80cdade8cdfb5268ed2 [86/168] arm64: dts: r4pro: fix switch label
config: arm64-randconfig-2054-20260728 (https://download.01.org/0day-ci/archive/20260730/202607301747.qLwp6YsA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301747.qLwp6YsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301747.qLwp6YsA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
