Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727953;
	b=ElvYYvyMW+desoTjt5pmEr81ZJcNa0Tfy+3QIvlB4Z3hPOktXYNMMtadkuqk8WxnYKdX
	 LftaPFENgXm2lyA4Mc7ulpF5jDmk4riLipr1VR91igHGKLHbV4maYSIOdXRfVGDuXJYrQ
	 NcPYbTpEncE42ctTSnhLwqX23WfxL6EZepHwkZszXUMLMYaz+a10etieuBdddQzDbnwgl
	 7/MwKeZV/U8QN13HeVrxSl2s6fjgWmZ3spRY1FXrun047X3zEwQIQFWlqpvK4eoB121k1
	 1T05jmaJQXSNoEColvwsNZVnnqk0Cju8jU0A+dON/GB98ELWjyrAuXM1ynLwOYVG0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727953;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lebuZM4VXUrYsNNyNX/kedXBYKuIoQX61pbhPkhN63g=;
	b=FrSAxpjLeF6WAyT0yQpST6f5J7cVdikuKPGxuJEbwlMp12ilgBddQVrZc6Q5GbIf+ArU
	 nEjNyfd/cxt11cMFl+AgtjIK+D7GSZsZxnaFGiR0Ls0yAszGcueOm4YJ1DBhM4u73t73a
	 zC0/MjOULOtBgfJ6XT58QfktBaoVgEuB49twzLJKqKJlcCVYNjdPk+0NeoiN7AFy9LCwU
	 6m21Fd/TbgfkBnAJIOYVCD+aUWlnyf6NAavt2fd50rS5xXeDhUuu516ntWNjJ7kBtE6mJ
	 Pg5k2nJmHdVEwHwKMkc/OzcHBt45itoB4OxWS56aAwP4G0VUlZnMj2lnj3c5OVX2zCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M+Xlu6Cc;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 07:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE2F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M+Xlu6Cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794727951; x=1826263951;
  h=date:from:to:cc:subject:message-id;
  bh=dofE4MwB/sQkYsfLdH+000sclz5KHxpO2rD/CY7JfpY=;
  b=M+Xlu6CcznI7vn0g9HmiDqQaKZJF1hIDnamgJpHMoDS3LCYhUxCkRJu8
   U4le5ptyHYitay3ALjMaqDBP1+TdHUez4qrbDWQFN7ExgJbGwPiXw+9gt
   rRlH78q4rEAn57QjMwGGfo9Kp3B72CQjSWiS3S5JvLGH7D2TWJGfGfZSR
   H6d0R7Qh+xAJqKWMQOnGEjPWzcz7C7301aOmV0YT44kP4iVZ/rhbwN09n
   0d+I3eTsnYnK0pW0g+kO3dYhV/rtXNuxFqMSDy6ywhFynAvu56ZF9rKJv
   Wk+FzczgU4iu2XIL2IAr0PbOrQPQq4UUAzDelexTn/2OND61V20fgxyH8
   Q==;
X-CSE-ConnectionGUID: TXOJYQ8CTcWIi3LzJtBaXQ==
X-CSE-MsgGUID: ZqfvS+3VRbuXa4vI8XumRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3519778"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3519778"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 23:32:31 -0800
X-CSE-ConnectionGUID: ySODHOfKTPaLZMvgVEusqA==
X-CSE-MsgGUID: 8+4yohnCTd2Jc7FKQPe9OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9633449"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 14 Nov 2026 23:32:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSUix-00000000268-1QrF;
	Sun, 15 Nov 2026 07:32:27 +0000
Date: Sun, 15 Nov 2026 08:32:02 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 4277/7428]
 arch/arm/boot/dts/arm/integratorap.dtb: /fpga-bus/rtc@15000000: failed to
 match any schema with compatible: ['arm,pl030', 'arm,primecell']
Message-ID: <202611150840.DwybjoZF-lkp@intel.com>
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
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: e7c38fdf57c42088e6e3a994b73f0cdd72289bb7 [4277/7428] ARM: dts: arm: Use standard node names
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611150840.DwybjoZF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150840.DwybjoZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150840.DwybjoZF-lkp@intel.com/

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
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): clock-ssp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): bridge: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: bus@c0000000 (simple-bus): gpio_keys: 'ranges' is a required property
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
