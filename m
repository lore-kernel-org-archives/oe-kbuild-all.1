Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF044AB94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813269; cv=none; b=V+yneDrM8+9RwPheGiXcbPUcuA6sUQq8+VSqJbhcpHKv4dIJqXpRL/SnmRRvekGvoNRJF9GEe+HttbMt+OLcq9wT0p1WQ72Z3cSnM2cxhI+nu1LAnfKHiUTITFYVw+jhQ5LChKjoBGgxNRxGHQ9dCW3jmr0RbXH2pzvZvc0SXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813269; c=relaxed/simple;
	bh=/6oL+g3/LRVVo2bkyyrdKRpmETLJDJHog28rN1XYNJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvHAUZmPNa4MPzKnDPjcIr+jLpBHnAJNNBnbZ0lXYLiGgQ8w5UX9DHbHQ4u+vLyX7X70Snctu3b28FDHxZsQJTuyoO0mDG8+9HM0PlIhoDyqP5bUPK5lHWx7k+i7GDybVnzvuwWsSUeUVbSIg1MP4kHtXXP0tKTNxfVW8gsKAII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbW/ies8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbW/ies8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784813267; x=1816349267;
  h=date:from:to:cc:subject:message-id;
  bh=/6oL+g3/LRVVo2bkyyrdKRpmETLJDJHog28rN1XYNJE=;
  b=TbW/ies8ThI/TtUCjg5uzeqp8NTgLfT94it5KsA6xDiAtlH7hi2wtDla
   G5gZRblhcryF/FJjXpFX60lBhtit3pVZ1IHYb9nvOJYSAOO0P+a42wK8z
   9ewOCtViZGHqpu1M2n68eB3lR+hxfq3Tf6EpbxqAuh4UAYn8n9HK/gULp
   BNSI7QaCBnEtn74LvWaQI1NzFzGYi+TABaUCX8JHO2T27GvJWc+jGORsf
   KF4pl8RqbQzdCW8nvM6Glypx+I8zS8uGVt4humLGJu7mPeZ2SJCh2CvW0
   FA+k/hFGKH4kfkfrvHe4v3hCCqxZ+oUxWoEBvD0Q/lBttZ2H8PFVMdPav
   w==;
X-CSE-ConnectionGUID: s2ZeAApITKuBb0zhHGnkTg==
X-CSE-MsgGUID: LKoxdrplRYagFmhjbDzcJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="111008250"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="111008250"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 06:27:46 -0700
X-CSE-ConnectionGUID: 4jlRHjqiRiSswir5FpH9uQ==
X-CSE-MsgGUID: 6GDWMq1ZQL2QSkZ+nW17lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="281718203"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jul 2026 06:27:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmtSf-000000000lq-2yaS;
	Thu, 23 Jul 2026 13:27:41 +0000
Date: Thu, 23 Jul 2026 15:27:24 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm/boot/dts/marvell/kirkwood-l-50.dtb:
 gpio-expander@20 (semtech,sx1505q): $nodename:0: 'gpio-expander@20' does not
 match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
Message-ID: <202607231519.QguJpRRP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 9e5e1de61db29277d107bd6985c57629df449610 dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
date:   3 months ago
config: arm-randconfig-2051-20260722 (https://download.01.org/0day-ci/archive/20260723/202607231519.QguJpRRP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ba2be3f8add2e63266686cb1bcd40c9fab07de7b)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231519.QguJpRRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e5e1de61db2 ("dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231519.QguJpRRP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: pcie@82000000 (marvell,kirkwood-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
>> arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@20 (semtech,sx1505q): $nodename:0: 'gpio-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@21 (semtech,sx1505q): $nodename:0: 'gpio-expander@21' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/i2c@11000/rtc@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
--
   arch/arm/boot/dts/microchip/sama5d3_lcd.dtsi:28.13-32.8: Warning (avoid_unnecessary_addr_size): /ahb/apb/hlcdc@f0030000/hlcdc-display-controller/port@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: ioexp@20 (semtech,sx1502q): 'gpio3_cfg', 'ngpios' do not match any of the regexes: '-cfg$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
>> arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: ioexp@20 (semtech,sx1502q): $nodename:0: 'ioexp@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: i2c0: i2c0-gpio: {'atmel,pins': [[0, 30, 0, 0, 0, 31, 0, 0]], 'phandle': 13} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: i2c1: i2c1-gpio: {'atmel,pins': [[2, 26, 0, 0, 2, 27, 0, 0]], 'phandle': 17} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
