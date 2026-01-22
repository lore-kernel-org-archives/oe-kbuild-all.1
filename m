Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D521C175
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 02:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047536; cv=none; b=pitwAa4uAXpDn219lTLFoSIX75/cWUe/MEbFJ9kVZep/2W9w+espKd7Kgk1Uz0c/RBERGxZHj4RM79F+x9kfsZI7Anj8iZl0FudBCRn4YjrrAIbNGnGg3RbFzsG1PEMTu3EDjBBxJsOb1VETDRte97gBKf88qPCpmXTQ+a0DwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047536; c=relaxed/simple;
	bh=UuA1mNpipfI97xGjwqRLOujFl4wFZRkE5kED3GSx+vY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PPVliQqxXjAy2Z3j0c6jAgPfA8MtxxtQxUS40Q9QB+72Gs9WbzC/SRhN7jHPUKf5pCGm8m/s9QpvaA5ExFhY1iwj5f64El1uxCmZ/SMTG0DaqWjyjcPOytRAPZ12iXtbluyUFK8pBC6xNKb13Q/9zs/5of3UpMJhZPSfFpjp0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGZAdcy+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGZAdcy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769047533; x=1800583533;
  h=date:from:to:cc:subject:message-id;
  bh=UuA1mNpipfI97xGjwqRLOujFl4wFZRkE5kED3GSx+vY=;
  b=PGZAdcy+lPx6M7Y3YFTa3/JOcO5K9xhqF0JDflnX+ddtq/OYiYL0rkh2
   PaVfjSotn5nuQXhNZ9kCLn9FwTCC2t0mhzAlie6STFB8FEKHfYfGbm73x
   wgzrlAA+r0EywilxCqZGLqLuJ/PMQpOCz8AqTaewgX2niB0pGcyj6dMVx
   8/pOWN9cbKCp9ZvRE8UycZ8RuLd1RkHzQTeBKmBJZ9AiV9SFxVSy+fOV5
   4YdvtQpcSEfkRZ+Y6sjaIE8zwtlgVJTz2a1xaovTwOYq0kHOxtQKen6T9
   5mxie0E7HN5rdGYWjnRyQefm9Rf2dFdp9iOdldk9mL6xKrNbEOoAUHXgN
   Q==;
X-CSE-ConnectionGUID: TcDvPPPoR/mrUGwuYK5FKQ==
X-CSE-MsgGUID: R2w2jcvCQfyCzZDhGfGuZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70376574"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70376574"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:05:33 -0800
X-CSE-ConnectionGUID: K/3oqa6ERieu6A/nqrAnRg==
X-CSE-MsgGUID: 7LfYkCy8TB6XJyrEm4Q3uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="205736073"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Jan 2026 18:05:32 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vik4f-000000000Q1-1ABh;
	Thu, 22 Jan 2026 02:05:29 +0000
Date: Thu, 22 Jan 2026 03:05:09 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linux-next:master 5634/6771]
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml: ignoring, error
 parsing file
Message-ID: <202601220315.9v8ujQtp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: bc5a847a80d45b1f77c60c738e05521f0dee453c [5634/6771] ASoC: dt-bindings: realtek,rt5640: Various fixes
config: arm-randconfig-2053-20260114 (https://download.01.org/0day-ci/archive/20260122/202601220315.9v8ujQtp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220315.9v8ujQtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220315.9v8ujQtp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/realtek,rt5640.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/sound/realtek,rt5640.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/realtek,rt5640.yaml: ignoring, error parsing file
--
>> Documentation/devicetree/bindings/sound/realtek,rt5640.yaml:58:3: found duplicate key "clocks" with value "{}" (original value: "{}")
--
>> Documentation/devicetree/bindings/sound/realtek,rt5640.yaml:58:3: [error] duplication of key "clocks" in mapping (key-duplicates)
>> Documentation/devicetree/bindings/sound/realtek,rt5640.yaml:61:3: [error] duplication of key "clock-names" in mapping (key-duplicates)
--
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/i2c@8500/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
--
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb7-gpio: {'nvidia,pins': ['pbb7'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 0, 'nvidia,tristate': 0, 'nvidia,enable-input': 0} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: serial@70006200 (nvidia,tegra114-hsuart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra114-hsuart', 'nvidia,tegra30-hsuart'] is too long
   	'nvidia,tegra114-hsuart' is not one of ['nvidia,tegra20-hsuart', 'nvidia,tegra30-hsuart', 'nvidia,tegra186-hsuart', 'nvidia,tegra194-hsuart']
   	'nvidia,tegra124-hsuart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /serial@70006200: failed to match any schema with compatible: ['nvidia,tegra114-hsuart', 'nvidia,tegra30-hsuart']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: bluetooth (brcm,bcm4334-bt): False schema does not allow [[20, 134, 1]]
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000c000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5639']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
--
   arch/arm/boot/dts/nvidia/tegra114.dtsi:828.15-838.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:868.15-878.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000c000/rt5640@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps51632@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65090@48: failed to match any schema with compatible: ['ti,tps65090']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1172.15-1182.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1212.15-1222.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1251.15-1261.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000c000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5639']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: pmic@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /i2c@7000d000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77663']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /i2c@7000d000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77663']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /i2c@7000d000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
--
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,ddc-i2c-bus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,hpd-gpio' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /i2c@7000d000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /bridge: failed to match any schema with compatible: ['mstar,tsumu88adt3-lf-1']
--
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /i2c@7000c500/flash-led@33: failed to match any schema with compatible: ['ti,tps61052']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /i2c@7000d000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: light-sensor@48 (capella,cm32181): 'vdd-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
--
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /i2c@7000d000/rt5640@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
