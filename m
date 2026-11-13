Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544170;
	b=OjaPGt66xbMxbJXzoSDh9945J+Fe77eN+cIkiwBZZAHXwXbbfFouNk3dQ16aIJP9zeOQ
	 86iXvQ4EdPEzsOTm0o1ozOSrSq+1Ho+Rgw01nl4o5u68ezBQVOos+0d8KdY4TUxtfk173
	 K+HeBZeKdMoIZ4Lfac4W4PoZmN0K9mFarYesPdfFypLvclGrsDEhVCGespKGNW6+bf0WZ
	 6JphMvVXkPNlEbAxr9cM5yI+oo43OvJH7nlZl+Vl84RT4oEoq9SUcAR85yX48Mb9NynoN
	 sb7Ipf95+Y6/Y2X2o20s3TRd++vecDfd5Rv2uJyP6dxCX2uXSGL47uHhWuyjHhsx00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544170;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xyIQQo0kdiJ0LvULWXephXGB2yePtwLEWGmY8EGj3E8=;
	b=07/otfx5x3JLDZQMf11UvROOEmC6Rb+TUpQjRKqKwaKTn5AgNAmlOlpaRDe007BeRR3K
	 my2nCHHHspQVdVDgILD4RoANWL0PytTec4InRXI0/uXKY28gOB/F9COOZTHLBVsKuN9Ev
	 wIJGgY4npcMRDOe+XPTeEh/3ooZOgaqCoZl9wdDFkc7JW0+u1ZIWvuPpX+fUYUUJmJUoL
	 I4/Yi9Zn6JbBec87eXcAmliq0uIE+6TZcIy2PnIO15Ke3hCKgYbW1mIlcqczPp4laLmGA
	 vxSiPpmojsOpHhORwrDifVbD6zXTSJQLE78Tk9fKWkguNHrReUQaxyC9NCbC/HMrwdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WL7Q4NTN;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 04:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WL7Q4NTN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794544170; x=1826080170;
  h=date:from:to:cc:subject:message-id;
  bh=sHoLa4oOqfYp1izaljurW/kkSDDfqItDqILiwmzr/YE=;
  b=WL7Q4NTN5mPJXXqOcFbvbSS3Ymmy5YzzxQIzZwScVEnXuRNOtN4r2fwo
   Zj+afBOWbriVEwBWsw2fqkcr2nSHIvJp8bKFL8xfwxPRNxVJ98TIto4E7
   YtjNYGdQnoTNWRpj2vuAveLEVb265ofDowcg7Y8PAxjWBsWbRtG6GLWb5
   /xmvYx5i3a5Eib6CHXGiyiSiSlNqj632TrafqRdH0QBWJ8ZGwmkH36dbv
   tAeCcq+CmaycNOaCJOp7Kr30TgcXQT/X7jhdkuxzZM0MXk2R97Ymp3V4a
   MHKXUvM8Y690PenPI7mtnxr9SokiCsR2IA7ji517XdxAjK47ybds3freF
   A==;
X-CSE-ConnectionGUID: BOxr/SEATWWdFI8uVEFYuQ==
X-CSE-MsgGUID: 5wU0iGq/QXGCGmPh0bWydQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3381605"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3381605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 20:29:30 -0800
X-CSE-ConnectionGUID: 0Kx5h816TOq5U2fVKU5tTQ==
X-CSE-MsgGUID: FTwL7JFOR2alXypP0h9fhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9113045"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2026 20:29:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRiuj-0000000016N-2xW4;
	Fri, 13 Nov 2026 04:29:25 +0000
Date: Fri, 13 Nov 2026 05:29:23 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 4619/6082]
 arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/rtc@15000000: failed to
 match any schema with compatible: ['arm,pl030', 'arm,primecell']
Message-ID: <202611130518.aXB9E4oy-lkp@intel.com>
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
head:   793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
commit: e7c38fdf57c42088e6e3a994b73f0cdd72289bb7 [4619/6082] ARM: dts: arm: Use standard node names
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611130518.aXB9E4oy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130518.aXB9E4oy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130518.aXB9E4oy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dtb: / (arm,integrator-ap): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: /ebi@12000000: failed to match any schema with compatible: ['arm,external-bus-interface']
   arch/arm/boot/dts/arm/integratorap.dtb: /timer@13000000: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap.dtb: /timer@13000100: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap.dtb: /timer@13000200: failed to match any schema with compatible: ['arm,integrator-timer']
>> arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/rtc@15000000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/serial@16000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/serial@17000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap.dtb: kmi@18000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: kmi@19000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: syscon@1a000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: aliases: 'arm,timer-primary', 'arm,timer-secondary' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/arm/integratorap.dtb: clock-14745600 (fixed-clock): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:176.3-197.5: Warning (interrupt_map): /pci@62000000:interrupt-map: Missing property '#address-cells' in node /pic@14000000, using 0 as fallback
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: / (arm,integrator-ap): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /ebi@12000000: failed to match any schema with compatible: ['arm,external-bus-interface']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /timer@13000000: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /timer@13000100: failed to match any schema with compatible: ['arm,integrator-timer']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /timer@13000200: failed to match any schema with compatible: ['arm,integrator-timer']
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /fpga-bus/rtc@15000000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /fpga-bus/serial@16000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /fpga-bus/serial@17000000: failed to match any schema with compatible: ['arm,pl010', 'arm,primecell']
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: kmi@18000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: kmi@19000000 (arm,pl050): 'arm,primecell-periphid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serio/arm,pl050.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: syscon@1a000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: aliases: 'arm,timer-primary', 'arm,timer-secondary' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: clock-14745600 (fixed-clock): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): vga: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): clock-ssp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): regulator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@0', 'button@1', 'button@2', 'button@3', 'button@4', 'button@5' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: /bus@c0000000/bus@c0000000/rtc@600000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: display@1000000 (arm,pl110): 'dma-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: display@1000000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
--
   arch/arm/boot/dts/arm/versatile-ab.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/versatile-ab.dts:406.22-414.7: Warning (unit_address_vs_reg): /amba-bus/fpga-bus@10000000/sysreg@0/display@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/versatile-ab.dtb: / (arm,versatile-ab): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/versatile-ab.dtb: /core-module@10000000: failed to match any schema with compatible: ['arm,core-module-versatile', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/arm/versatile-ab.dtb: /amba-bus/interrupt-controller@10003000: failed to match any schema with compatible: ['arm,versatile-sic']
   arch/arm/boot/dts/arm/versatile-ab.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
>> arch/arm/boot/dts/arm/versatile-ab.dtb: display@10120000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0', 'endpoint@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/versatile-ab.dtb: /amba-bus/rtc@101e8000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/versatile-ab.dtb: /amba-bus/fpga-bus@10000000: failed to match any schema with compatible: ['arm,versatile-fpga', 'simple-bus']
   arch/arm/boot/dts/arm/versatile-ab.dtb: sysreg@0 (arm,versatile-sysreg): 'display@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml
--
   arch/arm/boot/dts/arm/versatile-ab.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/versatile-ab.dts:406.22-414.7: Warning (unit_address_vs_reg): /amba-bus/fpga-bus@10000000/sysreg@0/display@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: / (arm,versatile-ab): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /core-module@10000000: failed to match any schema with compatible: ['arm,core-module-versatile', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /amba-bus/interrupt-controller@10003000: failed to match any schema with compatible: ['arm,versatile-sic']
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: display@10120000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0', 'endpoint@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /amba-bus/rtc@101e8000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: /amba-bus/fpga-bus@10000000: failed to match any schema with compatible: ['arm,versatile-fpga', 'simple-bus']
   arch/arm/boot/dts/arm/versatile-ab-ib2.dtb: sysreg@0 (arm,versatile-sysreg): 'display@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml
--
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dts:59.4-77.29: Warning (interrupt_map): /amba-bus/pci@10001000:interrupt-map: Missing property '#address-cells' in node /amba-bus/interrupt-controller@10003000, using 0 as fallback
   arch/arm/boot/dts/arm/versatile-pb.dtb: / (arm,versatile-pb): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/arm/versatile-pb.dtb: /core-module@10000000: failed to match any schema with compatible: ['arm,core-module-versatile', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/arm/versatile-pb.dtb: /amba-bus/interrupt-controller@10003000: failed to match any schema with compatible: ['arm,versatile-sic']
   arch/arm/boot/dts/arm/versatile-pb.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-pb.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/arm/versatile-pb.dtb: dma-controller@10130000 (arm,pl081): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
>> arch/arm/boot/dts/arm/versatile-pb.dtb: display@10120000 (arm,pl110): port: '#address-cells', '#size-cells', 'endpoint@0', 'endpoint@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml
>> arch/arm/boot/dts/arm/versatile-pb.dtb: /amba-bus/rtc@101e8000: failed to match any schema with compatible: ['arm,pl030', 'arm,primecell']
>> arch/arm/boot/dts/arm/versatile-pb.dtb: /amba-bus/fpga-bus@10000000: failed to match any schema with compatible: ['arm,versatile-fpga', 'simple-bus']
   arch/arm/boot/dts/arm/versatile-pb.dtb: sysreg@0 (arm,versatile-sysreg): 'display@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
