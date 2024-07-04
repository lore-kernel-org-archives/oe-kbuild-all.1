Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936101ABCAB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091905; cv=none; b=FAefQTLUnxIJwpG2i+tFBpV5qjE3vpshdUTi3mBgIFhggFvdkgOb3AzxSdTrDM/YBo02r/7DQs4ggOsaq/YT4H9DoWe4UdsQP/rvvaQb5bc5ZlZ7S4vL6y0koiIdvTUWBarNL73ZRPE8ubQBQz0lartLcWmyOtEqWsibWkDp6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091905; c=relaxed/simple;
	bh=uRJuvxt8vAHRmY6AUPDaQ+ayp/GEcw3PaAoP8u9z/yk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FobBs/m22Xn0ZMzk4B7qU6GXQpIuUUWbGSeN54aaROp7M5EWMwuqAZnd6wXHHDXIkqSpTk92IZdtS14Brtl6wnd5iymM26a2hgOeq7t/zMJsZjdNQkxrtAnp62Y64k7MH3d4DKNpciH/W2JvInL6+uKIfNC71SQrQPWDSwPiZdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO8xnhZy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO8xnhZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720091904; x=1751627904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRJuvxt8vAHRmY6AUPDaQ+ayp/GEcw3PaAoP8u9z/yk=;
  b=hO8xnhZyyjQt6JrwUZ+WaZJ3sEYtso/NZsG9eQ62HpzF20oWx5CVfmny
   HssL6FSjzZckddli+M68bh1mP9jhRTiKpgh+FftXLE3bsoS9uPzTK2iGQ
   5Ow6gLSyxFUikjwTfqt7K17aH+CeITaL5Vvjw07GvPltZfX03TmSDdL+q
   BKqfO7Si/XMLKU0GUsH6XSYJ0ExRbHeSla1bS0ONHR0d1OEGXDPA7o7/f
   bMA+bPrHRpGCI7jlMDe2kFLPIbr6xFp6b6TfctPInIU2ZbIIjDmC9I8CF
   cLlijsg/eRtX3b4t5yrkhu+EPIdl10nIn/HQ/Xjki7J8vPdANMnWPsfiI
   Q==;
X-CSE-ConnectionGUID: QsdsFRXkSIytBx0YDZjbGw==
X-CSE-MsgGUID: iK1WRJNKTrW/ldr+CEWsSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17506754"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17506754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 04:18:24 -0700
X-CSE-ConnectionGUID: 5zibvq9uRmaA5SaE4SKhmg==
X-CSE-MsgGUID: WRzR4hOLSo+WWqM2B8NG3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46455084"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jul 2024 04:18:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPKTi-000QvC-32;
	Thu, 04 Jul 2024 11:18:18 +0000
Date: Thu, 4 Jul 2024 19:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 9451/10451]
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: dcc: 'clock-controller-0',
 'clock-controller-1', 'clock-controller-2', 'clock-controller-3',
 'clock-controller-4', 'clock-controller-5' do not match any of the regexes:
 '^amp-.+$', '^energy(-.+)?$', '^power-.+$...
Message-ID: <202407041925.USP0eqv8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf [9451/10451] arm/arm64: dts: arm: Use generic clock and regulator nodenames
config: arm-randconfig-051-20240703 (https://download.01.org/0day-ci/archive/20240704/202407041925.USP0eqv8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041925.USP0eqv8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041925.USP0eqv8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   		['arm,cortex-a5-gic', 'arm,cortex-a9-gic'] is too long
   		'nvidia,tegra210-agic' was expected
   		'arm,cortex-a5-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
   	'arm,gic-400' was expected
   	'arm,arm1176jzf-devchip-gic' was expected
   	'brcm,brahma-b15-gic' was expected
   	'arm,cortex-a9-gic' is not one of ['arm,cortex-a15-gic', 'arm,cortex-a7-gic']
   	'arm,arm11mp-gic' was expected
   	'arm,cortex-a15-gic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
>> arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: dcc: 'clock-controller-0', 'clock-controller-1', 'clock-controller-2', 'clock-controller-3', 'clock-controller-4', 'clock-controller-5' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: hsb@40000000: $nodename:0: 'hsb@40000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:116.19-121.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/usb@3,03000000: simple-bus unit address format error, expected "303000000"
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:123.22-352.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/iofpga@7,00000000: simple-bus unit address format error, expected "700000000"
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:354.33-360.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/regulator-3v3: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:362.33-367.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/clock-24000000: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:369.34-374.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/clock-1000000: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:376.33-381.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/clock-32768: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:383.9-433.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/leds: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:435.8-506.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/mcc: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: /: bus@40000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: clock-24000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: clock-1000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: ethernet@3,02000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: psram@2,00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: clock-32768: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: usb@3,03000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: iofpga@7,00000000:ranges: [[0, 7, 0, 131072]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: regulator-3v3: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: flash@0,00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000: leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: iofpga@7,00000000: $nodename:0: 'iofpga@7,00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: mmci@5000: $nodename:0: 'mmci@5000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: mmci@5000: Unevaluated properties are not allowed ('cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: wdt@f000: $nodename:0: 'wdt@f000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml#
>> arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: mcc: 'clock-controller-0', 'clock-controller-1', 'clock-controller-2', 'regulator-vio' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: /memory-controller@100e0000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
>> arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: dcc: 'clock-controller-0', 'clock-controller-1', 'clock-controller-2', 'regulator-ddr2vtt', 'regulator-vcc1v8', 'regulator-vcc3v3', 'regulator-vd10', 'regulator-vd10-s2', 'regulator-vd10-s3' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: hsb@e0000000: $nodename:0: 'hsb@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	'arm,arm1176jzf-devchip-gic' was expected
   	'brcm,brahma-b15-gic' was expected
   	'arm,cortex-a9-gic' is not one of ['arm,cortex-a15-gic', 'arm,cortex-a7-gic']
   	'arm,arm11mp-gic' was expected
   	'arm,cortex-a15-gic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: dma@7ffb0000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: dma@7ffb0000: $nodename:0: 'dma@7ffb0000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml#
>> arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: dcc: 'clock-controller-0', 'clock-controller-4', 'clock-controller-5', 'clock-controller-6', 'clock-controller-7', 'clock-controller-8', 'regulator-cores' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: hsb@40000000: $nodename:0: 'hsb@40000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	'arm,cortex-a9-gic' is not one of ['arm,cortex-a15-gic', 'arm,cortex-a7-gic']
   	'arm,arm11mp-gic' was expected
   	'arm,cortex-a15-gic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: dma@7ff00000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: dma@7ff00000: $nodename:0: 'dma@7ff00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: /scc@7fff0000: failed to match any schema with compatible: ['arm,vexpress-scc,v2p-ca15_a7', 'arm,vexpress-scc']
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: /scc@7fff0000: failed to match any schema with compatible: ['arm,vexpress-scc,v2p-ca15_a7', 'arm,vexpress-scc']
>> arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: dcc: 'clock-controller-0', 'clock-controller-1', 'clock-controller-2', 'clock-controller-3', 'clock-controller-4', 'clock-controller-5', 'clock-controller-6', 'clock-controller-7', 'clock-controller-8', 'regulator-a15', 'regulator-a7' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: hsb@40000000: $nodename:0: 'hsb@40000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
