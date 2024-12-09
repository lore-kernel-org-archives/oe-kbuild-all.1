Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1368166F07
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720991; cv=none; b=m2wHGXBmtiDlSgmbarYHhArulzxVdf2P4lgOf7/TQdLbSVYGO41HysQ5o37XPphQOhETa2pDxH7SQU8r0STB9aVbxc4pPGC0gcsmHx6grnoLI+PYrFn81J2w635VHPTqyV5j1VCxYb5ILcZ4ADV/ig0XasEkJsd7UtTbMBIZXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720991; c=relaxed/simple;
	bh=WABOolAwwndBkrnvHXawTnY1XGMoI/U3+dy0Kie/rmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YozqyDunpNUoE/ltDFk/kvgZLQtyeMQpkJPbTyig9nQ7GynHYwHYjepdZjC4+NAoavQkzTL0e4SmKMiioZQBfwq3tqERcclR+ezRWYxWT7WsA0xZLdyCVWj5qHKW9750MPckOKO5z8eM7/sYm+3C9gdBr7Bd45pR3xSqxESYz0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvLgGlya; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvLgGlya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720989; x=1765256989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WABOolAwwndBkrnvHXawTnY1XGMoI/U3+dy0Kie/rmk=;
  b=VvLgGlyagnL4z98lVjgMkB/3HRTAVZlFP8/I7xmT/HELHsl8dP2BG48l
   bkwUqD8wMgkhIlg5/p3Tizv5VjG+wYnkobrtIbQDKFyLqPhy4J0cImZ3y
   Tcl/SCKwkxthHOnq+68ka3HoT+PhAK3pJ2mi9GF3si95l2ERAIP+aaxYv
   /G4pTYa3CSDS3/mr6voxj3JCCT9yMGczLcCBta0D3eBZ52JhvtPDmC6Th
   DTJUFYTMdEA9k453w6LYJj07b0vCBXP51B1HolZSq+leDM7Ca1e2s+zpr
   0w2Vrjvw07SZf5dN+fkBMANV8J+wDvjcVw3b6oKFmhc0a9XQFHhPm7E/x
   Q==;
X-CSE-ConnectionGUID: 7jT+rat+SCG+H87dyhuuHg==
X-CSE-MsgGUID: LWZxTT3uQdulBvyBlYtcsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45383762"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45383762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:46 -0800
X-CSE-ConnectionGUID: hrj2XZhcQwuUqAJJIIU1lA==
X-CSE-MsgGUID: XtOSnMNCRIW/Pdr0+qhQQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95053903"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yL-1D;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 1916/2462]
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: $nodename:0:
 'nand@2000000,0' does not match '^nand-controller(@.*)?'
Message-ID: <202412091024.2uMlgn0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: e0a4f50fce154c88c158562a1cee2c8b851c4e38 [1916/2462] dt-bindings: mtd: davinci: convert to yaml
config: arm-randconfig-052-20241205 (https://download.01.org/0day-ci/archive/20241209/202412091024.2uMlgn0d-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091024.2uMlgn0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091024.2uMlgn0d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mdio@224000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: gpio-keys: 'user1', 'user2' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: vga-bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
--
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: mdio@224000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0: $nodename:0: 'nand@2000000,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: nand@2000000,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/usb_phy@2620738: failed to match any schema with compatible: ['ti,keystone-usbphy']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: usb@2680000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: wdt@22f0080: $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/timer@22f0000: failed to match any schema with compatible: ['ti,keystone-timer']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: $nodename:0: 'nand@0,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: compatible: ['ti,keystone-nand', 'ti,davinci-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: pcie@21800000: compatible: ['ti,keystone-pcie', 'snps,dw-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: pcie@21800000: reg: [[562040832, 8192], [562036736, 4096], [39977256, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/emif@21010000: failed to match any schema with compatible: ['ti,emif-keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@11800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@12800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/dsp@13800000: failed to match any schema with compatible: ['ti,k2hk-dsp']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/usb_phy@2620738: failed to match any schema with compatible: ['ti,keystone-usbphy']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: usb@2680000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: wdt@22f0080: $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/timer@22f0000: failed to match any schema with compatible: ['ti,keystone-timer']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: $nodename:0: 'nand@0,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: compatible: ['ti,keystone-nand', 'ti,davinci-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: pcie@21800000: compatible: ['ti,keystone-pcie', 'snps,dw-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: pcie@21800000: reg: [[562040832, 8192], [562036736, 4096], [39977256, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/emif@21010000: failed to match any schema with compatible: ['ti,emif-keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: sram@70000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2l-dsp']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/dsp@11800000: failed to match any schema with compatible: ['ti,k2l-dsp']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/usb_phy@2620738: failed to match any schema with compatible: ['ti,keystone-usbphy']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb@2680000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: wdt@22f0080: $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/timer@22f0000: failed to match any schema with compatible: ['ti,keystone-timer']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: $nodename:0: 'nand@0,0' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: compatible: ['ti,keystone-nand', 'ti,davinci-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: pcie@21800000: compatible: ['ti,keystone-pcie', 'snps,dw-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: pcie@21800000: reg: [[562040832, 8192], [562036736, 4096], [39977256, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/ti,am65-pci-host.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/emif@21010000: failed to match any schema with compatible: ['ti,emif-keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/usb_phy@2620750: failed to match any schema with compatible: ['ti,keystone-usbphy']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb@25000000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/dsp@10800000: failed to match any schema with compatible: ['ti,k2e-dsp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
