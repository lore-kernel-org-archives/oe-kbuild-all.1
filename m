Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004519;
	b=K1gf8GJV8sBB+mUyyG3cfhgh77R8iKJZIDa2bifjy7CNM23gJANLnu8zDTRzIXkaWXc0
	 zS2Dz9hJAsbRqW8a+Q4qjKr/gwpcOeKrAfBpu9nIgzyF2hlr99bUhJObQm+h+INE8rnUy
	 UC2fjG4Q7O2gMmUf2Z1pTnVMDY6MOj8IUxlUQ5cL8xfm//ItLbIdL+tAjinBR/ufuSZZX
	 3QuFfr4jivJcwFKjawVy+MTrK015iGL28X+VyumoPhCPxdcAXJZKRDzEbCRdquSa4YUPA
	 Aowjy9XLRB0VgCvfjIwn3UHfeN30IuEdxWpZznIWvDUEQK833LmVpPSRKdW0XTADMAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004519;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qo9n0FD8jfRWT/8tpIm3AfT+OEv6sUgixSY7ZM4bhNk=;
	b=f7l9deZ34Shds7mEE8w6YEUPjxJMQayQFXvUWsrc91wg7aD+IaNeAlz6qsTuPC3M+/Tk
	 0AU3cdQtVT+XUjHt6jiVQimdESD115V4UbUWfp/KKQ3EkLsTIid2+nUNqt+7jxPXh6xue
	 ZfYiV2PdkuNfKf7OYvYKAzJtPsaNtSxAIVlrcFNSeS4VUuUYfe/MCBullQhf7oBV9DBqd
	 zdxSaVvKZpeO+OXfx39B7agTjxlUHi9OYr7RJtB3wSDGMxflLc9vIsqYc6NZY+fjo+GJi
	 IeO4LFaDNX2yO5ZnwYVYto1ujNLuIK3jHhFtWvKiRegImMBD69ittnuld+HyoAmBWLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdfitSgv;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2900606A31D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 08:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2900606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdfitSgv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793004517; x=1824540517;
  h=date:from:to:cc:subject:message-id;
  bh=Y188Dg0tac6YXAOlTsYJ0pKMJCVRL8XHRdbYwGEsl9A=;
  b=hdfitSgvLEbxDbSUdoQiuwKuyRddEtd4bzJEWiWPgh5YIl6lVkre6EYC
   yNCIRGKCFkU0L9nvSUt/FYl1Tg6/OhjG1WFzICTwcjS6z+6f2EvnrH2bk
   +ULnUk+GFsJnRzUjmxPZKBIuVS+xzhMNPWYBhYOWGsCg58vKA7p6hZo+Y
   oVqDUIYOFDkollA+RVI1e0qBs0Tbeo5fHvcRQ6pfiNOMCCM3WZgk/Fg0G
   b+kw80s2ccF0SI27v3XT3T2Mi+2MtXsuvdca0z60FDQlAG+I19fYfBZXd
   9W+1oIAi4B2CmvDzxRNfDK3jYLEXwcfX36n0PkVTg8p9gjhAj1rzBUx08
   A==;
X-CSE-ConnectionGUID: 60sT6+u3TfG4wYZiQMlXWw==
X-CSE-MsgGUID: ARFYO48uRsaVWVD23IlkWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1771198"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1771198"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 01:48:36 -0700
X-CSE-ConnectionGUID: c0JzeBPJRJWLgNZH8wQNAA==
X-CSE-MsgGUID: D2IAn5qGT3SDeh0ShLeUZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4595525"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 01:48:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLGNc-0000000041H-1nbh;
	Mon, 26 Oct 2026 08:48:32 +0000
Date: Mon, 26 Oct 2026 09:47:48 +0100
From: kernel test robot <lkp@intel.com>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 16862/19841]
 arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: netxbig-leds
 (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power',
 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$',
 '^pinctrl-[0-9]+$'
Message-ID: <202610260908.MGqGCNpi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf [16862/19841] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261026/202610260908.MGqGCNpi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260908.MGqGCNpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260908.MGqGCNpi-lkp@intel.com/

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
