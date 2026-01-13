Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780FD2D592E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316211; cv=none; b=emF+rzZOQ90XEihQtB/1b4vlS7UUXaB1IYjck/BPMCTnFQqkZcpon7J26Q0NqFFk674lDnHHuAEZWQUlOtY1YtFkbe1poRIiyfMc69OAjuivpserxvy0cf0Kfxv9jPzxQMNKA394sIsBIcWZGVO++uBlMEYzSCJ9yhtzew5goNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316211; c=relaxed/simple;
	bh=CmnG4ygItsdz2o+/1YMtaeZFiR7Yita5k4VUv9eSRXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ti6Lkq3fll8VEuqQdejHyfYm9J+LuVnnSHjxNpaBTkU2Zxncc9cpD5zK/gbOKe53s+IZ6J1kulOOxneu1R/8iPyzwsYiQw1OQMn2FGo9UJyV3AZqGfWPwhXyCEMq3T8BAh2Q2rBtNLcqGxmEZh6vpa4eGKs/FN1MZjyngTipYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLdanuRd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLdanuRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768316210; x=1799852210;
  h=date:from:to:cc:subject:message-id;
  bh=CmnG4ygItsdz2o+/1YMtaeZFiR7Yita5k4VUv9eSRXA=;
  b=KLdanuRd7To0wMv3FNFlRBHz4tm7jQZetfqVjpOm41633z6GEjLn9lPA
   sKgYmGzgeO8Coarx55NwczorbJ6V3P19x3trzK7MuF/yBDjY6lrPRQCM+
   nrtLUvljYGj+vgZtYI58unbwa38dlbAZBbCUtNKk7I8Dc5l9yCk0P0Nfn
   OP7CbKAX3Pmm/9KXI5sPwTY5zfQSmk3ocuwjJdw7ZGy0JlqRVEsR7S8Ij
   lz4MYGPqskA7sW/HTJk8mRcU+YCy8NJr4WaGnlo0cAK3V48u34fXvOhZk
   vCdhWnkZmu3H3b6WqPYlICI57cPh0mGhItopcbrKjNebpYqxgkbrTCJoL
   A==;
X-CSE-ConnectionGUID: Cs+T4yYzRVGVonPnM5lwTw==
X-CSE-MsgGUID: KVzNgnaSRIi1P2OTAGeLQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87183111"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="87183111"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:56:49 -0800
X-CSE-ConnectionGUID: 6LhXyMSCSSWWLBRNU+ZUjw==
X-CSE-MsgGUID: 6kJv5dFLRMqvXNMgeRNFXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235116307"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 06:56:47 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffp6-0000000019F-1PA8;
	Tue, 13 Jan 2026 14:56:44 +0000
Date: Tue, 13 Jan 2026 15:55:49 +0100
From: kernel test robot <lkp@intel.com>
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb:
 btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match
 '^bluetooth(@.*)?$'
Message-ID: <202601131506.CykI6BjZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 73d2d709cc172da53402c9b2ead39bebc774ea16 dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
date:   6 weeks ago
config: arm-randconfig-2051-20260111 (https://download.01.org/0day-ci/archive/20260113/202601131506.CykI6BjZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131506.CykI6BjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131506.CykI6BjZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: / (google,veyron-fievel-rev8): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: ethernet@ff290000 (rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: / (google,veyron-jaq-rev5): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: / (google,veyron-mighty-rev5): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: / (google,veyron-tiger-rev8): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[62]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: ethernet@ff290000 (rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
