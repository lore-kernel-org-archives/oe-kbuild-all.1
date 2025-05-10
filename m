Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E200519C556
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 03:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746848375; cv=none; b=A4fq1N0KrPaur/gSulgt6Os2t67c7Bzq3a2U0s/Jo9NWByFv4XzSfJV0NMS+ROjMJbJXOdlx5HzfBt/2VERItq82Ed+aQ8gV3kowKDgBUGfHwRTRaMXPeJ7qeVZlMLeYGKzPyUiY+Sg5nxSEtw/ee8yYeWylbGhb8lI/uha/HrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746848375; c=relaxed/simple;
	bh=HB7dFQt77i4tqLZrYevQALKXiby1QbS2LmKHJzV2AYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7bHib6IvUaPZgNtUBY7t8ekVbxsorO5bIlLM7qZypw9DO+eirk3aXrNpFt3G0PQ8xElFIQSKlVP+Sny9uQmWFUTxj9vqCVVyNE6muXKEZAt+WNnBV9PY1UPeaCgdSyMSq9Yw3Tlla1UZKIpFYrv2E+WQY25xCoydSsBtp5rbBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwR8lGtw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwR8lGtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746848373; x=1778384373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HB7dFQt77i4tqLZrYevQALKXiby1QbS2LmKHJzV2AYA=;
  b=nwR8lGtwuH+eTKDwiyVRoIexbqa5pzMl3U+dJ6+uGV0VlClbXPQdsi19
   /8RjRxP8lFVBJ+5FpkFT+zupYFOfrPscyXFjJ+RyAqK+skRdC1pSbuosr
   K6md4nF83oyhZzMhNNkvH+wb3Y9BuP9zfDeAYxCDe8gtDXsU/pS4oDx6l
   C88u8xEdguPLTJuWzibZ+rtJp6Ly0is844DIT6Y8uxu2LtMiPTYSGwOmC
   Aujbm5/WuQq1hHpMfspKL7BNM9AWPqBCO3htJf8GIumtRI58MJARrgdVd
   9y7t/c+dcmj4vMxa4t3Y4YcRd1SufGwn/wVD6BV9LlPan1dVWUcqOsqEk
   A==;
X-CSE-ConnectionGUID: r4CjJMviTaKheMpnLz36lg==
X-CSE-MsgGUID: ZXEj1cYDT/ChOd/VZAcNqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71201576"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71201576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 20:39:32 -0700
X-CSE-ConnectionGUID: GXwxrhWpSvuXGtMp6/hUAA==
X-CSE-MsgGUID: FoygH8MgTQS9cOIz7lU//w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136745448"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2025 20:39:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDb3g-000ClJ-0z;
	Sat, 10 May 2025 03:39:28 +0000
Date: Sat, 10 May 2025 11:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8289/10031]
 arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: ft5426@38
 (focaltech,ft5426): Unevaluated properties are not allowed ('compatible' was
 unexpected)
Message-ID: <202505101107.wfT27iry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 5d511d93c0c3d9cf0ad28708d2d945d61ea27f01 [8289/10031] dt-bindings: input: touchscreen: edt-ft5x06: use unevaluatedProperties
config: arm-randconfig-051-20250507 (https://download.01.org/0day-ci/archive/20250510/202505101107.wfT27iry-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101107.wfT27iry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101107.wfT27iry-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'CPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'DCVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: ft5426@38 (focaltech,ft5426): compatible: ['focaltech,ft5426', 'edt,edt-ft5406'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
>> arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: ft5426@38 (focaltech,ft5426): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/mmc@f8000000: failed to match any schema with compatible: ['atmel,hsmci']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/ssc@f800c000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/dma-controller@ffffe600: failed to match any schema with compatible: ['atmel,at91sam9g45-dma']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/dma-controller@ffffe800: failed to match any schema with compatible: ['atmel,at91sam9g45-dma']
--
>> arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dtb: touchscreen@38 (edt,edt-ft5406): Unevaluated properties are not allowed ('power-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
--
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38 (edt,edt-ft5306): compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38 (edt,edt-ft5306): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/edt-ft5306@38: failed to match any schema with compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/lis331dlh@18: failed to match any schema with compatible: ['st,lis331dlh']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/edt-ft5506@38: failed to match any schema with compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58: failed to match any schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pmic: failed to match any schema with compatible: ['ti,tps659038-pmic']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pwr_button: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_usb: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: tc358778@e (toshiba,tc358778): $nodename:0: 'tc358778@e' does not match '^dsi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/edt-ft5506@38: failed to match any schema with compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58: failed to match any schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pmic: failed to match any schema with compatible: ['ti,tps659038-pmic']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pwr_button: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_usb: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: tc358778@e (toshiba,tc358778): $nodename:0: 'tc358778@e' does not match '^dsi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
