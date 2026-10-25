Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907149;
	b=IWZZE0W+JS1iOvl2RaRWzB502q++3tvnPdy9ee56CFXM2aFdI4h1F0PS5oRQKuJHavc/
	 FC5vi9CW9azYxWZ83s03FUs/EH1Qul/6utxjiUqSbtIGH3HtAeEFUQ01LXsongdDKSa0+
	 ocwNchUi4zDuTT87GsBMIsaZ14IFuFOJ3b41IXgIIk4r10QFheapNEkXeh8UzGNAwFkoa
	 Zse44XJg4HyvrEovmRt7c/5tA41vKMYbD4d31m1xpCAOw9uP/cgFhbTIgVBne46zx6XUA
	 VKs6OwI0CQJKlKvzdLEnfYA+XdDP4K4x+i0HRA3uca+eKq2IOemHRsOM/ruAb6OYgRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907149;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Nf0BbV31s0GsrWMdwpldLmShhTjHFFHLGpaB1SRvD1s=;
	b=I88+mRtKe9lDK2bX78Mcz99E+qS7tN8xmn048zhmOI14gkzCElaPtrK40JrTwLM9Ux+Z
	 2KIoBwgodheMeM2nA6FP43ue7cAyeK1/0anB9C8HAv76tM71mjYKBdyydrdoVWlyA1LCe
	 rqM4QlL+Z6zRTAeyLO7euxqAyhYs+RdmcL7BdMDzrmFoupg6JwG38ozVw++7nI2svmpHM
	 uuqH+w2V2UdhxRzKfPYEh4c+9KwKpsybwfsKKDAkF/BKjknLE99N3jIhu0hJ3L8iUZRpR
	 OBCZ8lA4IWfLDARXr9VfKbgwjDxMqGNMlQJ+pfDCKDoAO2EsM0EBx9DCNtDyd+76DTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RdZXalpz;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E26606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 05:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RdZXalpz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792907146; x=1824443146;
  h=date:from:to:cc:subject:message-id;
  bh=ibQLl6mh1B7aEAL+vWX/oLiuw5LMOxNBSS7n2FO1ff0=;
  b=RdZXalpz5zSrplHi7Hj6oydy79s4XZZIVkKEZwpmqydEbxQnk4/BUL4f
   PtiG0KXm6eaNG351dPQhGEnA5lEwZhr0X6zvqv6XjDk/FhyM8L2UjvSlP
   AZhGUTuLWvhM9LbPQ1+0pG1XfHn8Ky7LgdMn9jT7/bxx+E3lWwZ6tJMm0
   YeFJlDniKNaHxOeyz38Sgrk1WlUm1ZzLFMwY6+BfT0kpFbnGqO6cYqXKe
   E63skDY42LIj2Woxj4YUpuPTSzNJpcYuUurj7hNLob+NiqLN4rj8XifQH
   HF/HokKyF++NWDPYAED7At2u1UZBd1zLlU9zHG95f9YZJnrvkk32JCfDM
   A==;
X-CSE-ConnectionGUID: HrpNzJcERHiYHHdT7Sew1Q==
X-CSE-MsgGUID: UB/Y4ZazRrSI2VR/xAvdbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1593008"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1593008"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 22:45:46 -0700
X-CSE-ConnectionGUID: WLFKf3RYSfCpMsaJB++wZQ==
X-CSE-MsgGUID: 0QrvWhnRRKa68lnh3dnEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="5737030"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 24 Oct 2026 22:45:44 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKr37-000000003d5-10C2;
	Sun, 25 Oct 2026 05:45:41 +0000
Date: Sun, 25 Oct 2026 06:45:17 +0100
From: kernel test robot <lkp@intel.com>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 16862/19841]
 arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: netxbig-leds
 (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power',
 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$',
 '^pinctrl-[0-9]+$'
Message-ID: <202610250604.ZlrPg2yH-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610250604.ZlrPg2yH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250604.ZlrPg2yH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250604.ZlrPg2yH-lkp@intel.com/

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
