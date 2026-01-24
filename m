Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524D83A14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769249819; cv=none; b=b+JcrZiQn76zf56kBXNLZAvtixXlRtdvwxs/6X8zOCi2kmcyYdN9ggh6ZFrepvpLPDXuXBqxLzctcvzamigN5EHzWiffhlVh7+U4b1+YfHFzjp4gNMZVXttipiXkmC5bQsaVIXYsIYPcmEU0XIcZSId6jP7XXRfn7lnP8JuzcSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769249819; c=relaxed/simple;
	bh=G5Z0OmNSGOho2CZ2gXR4SV5TdkPAcGdwccitTkPlxso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z6DTl/7c3ZO3LLR1440LEDIqC6B6fXJcYH4HWW/IvCehgNdzvZbOd58LHmOhpzJs4CYSABI+Wnt8CAhuQ8399DFzkNf/CHUTS7KcVpHC1UEv+4Jw3WI1RSDKOkIb+6/FbKZ9KuYpWlLkyHhtQsEWque2y2iQYuq4cRwcbw0ig7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cb1noZP2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cb1noZP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769249817; x=1800785817;
  h=date:from:to:cc:subject:message-id;
  bh=G5Z0OmNSGOho2CZ2gXR4SV5TdkPAcGdwccitTkPlxso=;
  b=Cb1noZP2dbly085gZsyyj0sjmueoVM4CkVQdZ+IPfvFf6d4uYpjKjwaX
   vXaIXMIPwkQ5Yi+PV80AmTI7PzPpSvueMYJpjiQmZXjxADsRWLsI4fJdQ
   o3zkYp3JautRGjDEn4GaBSY4BQG3LSoQIoOplukEr4biisCmKB8TtIdVx
   WqnTVJU/7/Y85FSDXETHUjln+fmUYynL/0CnQB6nyYhj+psf9XWZTVd4Y
   6af2x2GKIqbkX3x6o/ZRJl75eSTHKQ535784vV3JiKhDLGbxumPPbTgMd
   cj4HyPBzz4+VzI6Z8bvYeMmB0OK9mIEhJg72uoAPt/ixBeK4qoMPm+onc
   w==;
X-CSE-ConnectionGUID: YJsXAbOURgKeoQX5q0tGWA==
X-CSE-MsgGUID: WAQB8sz/RUybylfjvlpyHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="87902521"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="87902521"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 02:16:56 -0800
X-CSE-ConnectionGUID: 3mPnFF5CRI+ckd0bH+IzdA==
X-CSE-MsgGUID: 2+atLEzLTjGLRwa3aB2CDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207582917"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 02:16:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjahH-000000000wf-3fMC;
	Sat, 24 Jan 2026 10:16:51 +0000
Date: Sat, 24 Jan 2026 11:16:36 +0100
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 5322/9290]
 arch/arm/boot/dts/st/ste-snowball.dtb: battery (simple-battery):
 'battery-type' does not match any of the regexes:
 '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$',
 '^volt-drop-[0-9]-microvolt'
Message-ID: <202601241157.2B8SEW93-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
commit: 16056396b7709b0ee33d88329e9a41166bc8d6a0 [5322/9290] dt-bindings: battery: Voltage drop properties
config: arm-randconfig-2052-20260122 (https://download.01.org/0day-ci/archive/20260124/202601241157.2B8SEW93-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241157.2B8SEW93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241157.2B8SEW93-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
>> arch/arm/boot/dts/st/ste-snowball.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1', 'button@2', 'button@3', 'button@4', 'button@5' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@139', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: battery (simple-battery): 'battery-type' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$', '^volt-drop-[0-9]-microvolt'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@145', 'vdd-supply' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
