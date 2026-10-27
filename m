Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082081;
	b=sBUpe0VYBaBoptnnMbBaeue4nAM+7kkFBYuLyznR+mvF2RahNH0f+n4Dc8vQc2hJ5QaT
	 fuJWBEPr3BQpZzWbf88uJprWb6lJs8AkQ0/Vg/kCsJUg1/0N7KJblTEcZcHWqbGkUilV7
	 aA+IZwrz12HV2pk8CGP4RMXenjF2lHLChkItSQbcXxKxZh7aUT68ogyrln1Aq+j/MPRP+
	 q2fEupcDfulIiz6IpO5KjU3jQ5T+gYNTvjOE4loVn9Pv/uOC6OCWyViTWVT96EJhwFLcJ
	 lg8i9792l56sHbAyfy2UPZC0zacWFdz0xWd68Tiz7/gHz9kM271eWWqQaXA+Qm6Kn+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=C1HGCzEts5FhWN/0c/kmpCyKUCtnx8elLYeqHe7xyuQ=;
	b=PsqHJKe6DN57KaaeCmblUUdZvKukcu0woHsJAMWSJSKn0nYTjKtzOptqGJ/9OJZrbGCK
	 JrlvUjBBchomQfFKNzIDgKlO+0bBiukK1AE3WPgMOaxidHM4I9dcs7NIjRGXKo8JG/xnE
	 KhLSY30e1tcwqjLclQuUosrePaFJl0RQWUhhJKxi5pM5HbeuDnafKwuAjMdmsUOLJY2wL
	 FYY+CvajuPtqIzS0HP2HBrmdJhR/z9YOlXT6WZqZ04pch/S6c4DdmyJGCwg0Tmy7cwE++
	 D1lzlJlUVweEu2WjnRR7rbUPlHvxs2MVFkUUDOcTjYSptJdAPyT7s6xJHDnERDL15rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eoqLHCWJ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437A606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 06:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5437A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eoqLHCWJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793082079; x=1824618079;
  h=date:from:to:cc:subject:message-id;
  bh=FnmrINqASpiP3ae+XIm+SSotaoSMoIsF52+jCcCg1TA=;
  b=eoqLHCWJAlajpuiMvRIlMrXqaRvKtg1eShcVTLpAiXv6PnOywWolg5q0
   mngIp0W4zEzxzLGrHen0olE2rcG/gSbYgUvzl22P8IfxY95uPdML9EsM4
   /WNEiSufKjzZgrPdv1kkC5V6veAt80FWw6o5LpFkpFiMqZ5tH+DeOlrWE
   lAjTEL1xnliUMANrOn7eP9PXII0511l/5ASrUaD6CRci0ytc4qQflRfbz
   pQE/cM9+Pur8z0Z5y5mfQDXVMLZHFczTYh4dJda0e8LIxEr2l/sDMNr4r
   L+numIqgbZyiVDSzqiZgWZUJzn+LMXAjEpsT+zYrs6Ca0mzKA9YLD0nz+
   A==;
X-CSE-ConnectionGUID: L7KaVu0UR8y55SJijqIQSA==
X-CSE-MsgGUID: ssLyVPi/QC+qggGustDhdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1784944"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1784944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:21:18 -0700
X-CSE-ConnectionGUID: MqQArQghQqqTe5x9dKXoFA==
X-CSE-MsgGUID: vhJKEH8hSd+H/+K5zbCOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4444293"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2026 23:21:17 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLaYc-000000004PL-20TZ;
	Tue, 27 Oct 2026 06:21:14 +0000
Date: Tue, 27 Oct 2026 07:20:57 +0100
From: kernel test robot <lkp@intel.com>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: netxbig-leds
 (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power',
 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$',
 '^pinctrl-[0-9]+$'
Message-ID: <202610270710.aWUm0pbv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
date:   12 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261027/202610270710.aWUm0pbv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270710.aWUm0pbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 59cf91cf87ab ("dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270710.aWUm0pbv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): $nodename:0: 'regulators' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulator@1 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
>> arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: netxbig-leds (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power', 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: regulators (simple-bus): $nodename:0: 'regulators' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: regulators (simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: regulators (simple-bus): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: regulator@1 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: regulator@2 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
>> arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: netxbig-leds (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power', 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: fan (gpio-fan): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: fan (gpio-fan): 'gpio-fan,speed-map' is a required property
   	from schema $id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: regulators (simple-bus): $nodename:0: 'regulators' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: regulators (simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: regulators (simple-bus): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: regulator@1 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: regulator@2 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
>> arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: netxbig-leds (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power', 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: fan (gpio-fan): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: fan (gpio-fan): 'gpio-fan,speed-map' is a required property
   	from schema $id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: regulator@1 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: regulator@2 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: regulator@3 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: regulator@4 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: regulator@5 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
>> arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: netxbig-leds (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power', 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
