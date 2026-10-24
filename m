Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851840;
	b=qsDSdcON81sF/6ipnHRPskK/98Wrd/BFFaXt3I/GpUP64PRFHAehnpDQu0InhVxR2K0p
	 r2iqnB8rkjFtNdQnGr8Z4ytN0OValx8TcVAUjFSTR0nxoGGiL6QnVki2YB9POU9l7ASvQ
	 0unWvHSQaL/uX93QON2CAqcTeqO+tIppKj0misyRoGRFt+wnHiV8SVxl/UPCcGVzQ7E4i
	 qv+T92F8uN+o4f/iA4ox1ZElXPPV/WHwL1Go4j12r5N3mdyoMs4WAod7gl5FFLNXK3eSg
	 GlIrl/PiGQP1qReUdx+8b1vHN/JfyveMsG5j3BY4+yaU2KqgPE8Ywhsy0AjST9SNsyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851840;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+T+b7ZDYl/54Qei5grZzUUWJdzOwEZdfGtvM1kweR0A=;
	b=1THn6+Sprac2F5M9Tjihgr/2ttiMyA4muDClZc67Lr9nybemfyRkuaEKzFGUPfd0oFbZ
	 ogCIYCbA8k0yt+gcrr6n1BryNNGnn3xQY0xRwOPA7fUXr2ANlW0URrFY9jYGayG9cT7ba
	 T9OlCW6FchNtyO84JRJGy32rRpUvWrMem0pNL65k4LZKIn0HrWIRIanR2tOETUbUTigMV
	 F7BiilWDdg4faDD7nfM3qdXCGtIBDT2cvGNCEkQUBqfNXCedMahC41bTcNusXiWr22bGw
	 6hUUp9duhMuaIT7W1AWlpSoje031+VdpwTYKBav9Z7MJUrta/P68sqZJRKBUoWUockw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QemIv64T;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F062606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 14:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F062606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QemIv64T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792851839; x=1824387839;
  h=date:from:to:cc:subject:message-id;
  bh=3+i/Ipwc+bu55svqx3mF97l2s8WnhUPnX0A02ZC1j7U=;
  b=QemIv64TFES4eMJBAyOdGNRksuX9KLofcfKpV4E3mxr4BsefLi96SR7C
   rgSiIAvV4zN1HWxmwBWx238kpCJ88JzeiSp0gTn8YNatYGoD4q7H3TkEN
   DhMJnXB6oMI1VlE1aym9POp/cVq5NT8WPlygZK1+v0PEPOB6f6N3zxuTn
   AhE9pwRTJX4+gKpQdYaIAfE5BsCeSK6zZvFbmkxpQK79yADy/Lyayroou
   MBW6HguTKFIefsJm+stJe1TMAeAk8+jfNFUk384nG76SiMBohZwMssmt/
   HCwGS15ZPiYTtqruWrQokCO5ttgUdBRGijedIF0lxifofpYknniAnH41h
   g==;
X-CSE-ConnectionGUID: gNTkh6eGSsGyFj8YbZWB8A==
X-CSE-MsgGUID: RELR47D6TOuN3sjcTxY2eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1603168"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1603168"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 07:23:59 -0700
X-CSE-ConnectionGUID: FCRUo+rVQkiojJFyh/91Mw==
X-CSE-MsgGUID: h9eD+TzURo+QV43+Bpkh/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4238413"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2026 07:23:57 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKcf4-000000003OZ-3t7z;
	Sat, 24 Oct 2026 14:23:54 +0000
Date: Sat, 24 Oct 2026 16:23:06 +0200
From: kernel test robot <lkp@intel.com>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 16862/19841]
 arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: netxbig-leds
 (lacie,netxbig-leds): 'blue-power', 'blue-sata0', 'blue-sata1', 'red-power',
 'red-sata0', 'red-sata1' do not match any of the regexes: '^led-[a-z0-9]+$',
 '^pinctrl-[0-9]+$'
Message-ID: <202610241613.f8NldyOo-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261024/202610241613.f8NldyOo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241613.f8NldyOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241613.f8NldyOo-lkp@intel.com/

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
