Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6C309EEC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 00:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773190430; cv=none; b=MOqayClydO0NmPAW4W59sHa1uxt7hR9mVBvgVZrGMG6RZGTHPh4HGjMNP3hWy4jv7YOXHj/T5bHtQt6yIFCEazq3BtGgW7FAgqCF4gPDO7GH+RscRN1bgp0RQEgscqsotrCj+s4oCOaebsNgGELzohr7jl9HjiILOOfSpWGlmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773190430; c=relaxed/simple;
	bh=fpcwTcWMzSdtkHcTKSRTWLCh0w7BFKVMKe/c9Z0fZ78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CjIlBC+R0IMLQHplsJyH+k+1nrkDDunVOmmXC8YAgl2Cxt4SLtgrFlR33mV7nNwHKnttnofZSwIdiS2kIDFsoMjbjExjBgQ78Xr4IgSCQebqPuqDAMEpvJ4I+L3ldzx7JrpJkkm4JNWwYs1V+xD0EicZNsFzCZbQX7kylYacuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+aRlL3s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+aRlL3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773190428; x=1804726428;
  h=date:from:to:cc:subject:message-id;
  bh=fpcwTcWMzSdtkHcTKSRTWLCh0w7BFKVMKe/c9Z0fZ78=;
  b=G+aRlL3sKykEzISiOpFKMEpJ1TP7gwr8iPZ16H3cPT10oct4A1UJh7p5
   MLLaW0v9vGm3TKBDqBaTlJUFohhAprAwiMoOpy7KsJAigzyT/6ZO4ILsl
   Z4hXMMAsBQZ3Pjykq6gmpNAy2/sxDmd1YgypvPMGydMvlwM35wQu+mECt
   mZtRLA1fMCyxI7RGAxgV2OTpnM68BC46up6ydYGjaEK00nvd28XDQS9Kr
   qlbG5dC6dilpylU+WWA8MsbZR0PnHGFWY5oimlF+Ny2dClxvQ52EH4GuU
   uG248Q8SdAwdSAv5QwGysoS+aG0+Ln9vytLLRUATuV87k3gIJxiPjse6c
   w==;
X-CSE-ConnectionGUID: hqq17Y8US0eOHE2517ZLOA==
X-CSE-MsgGUID: KHTDhIk/Q+Ob+I4c7BeUmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76861011"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="76861011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:53:48 -0700
X-CSE-ConnectionGUID: d+/PlEfJSpKIU6MGbc0L9Q==
X-CSE-MsgGUID: mI0IcUySSmielUgSOhMcZA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2026 17:53:46 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w07pY-000000003BH-1BpU;
	Wed, 11 Mar 2026 00:53:44 +0000
Date: Wed, 11 Mar 2026 01:52:53 +0100
From: kernel test robot <lkp@intel.com>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 3775/5327]
 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: mpddrc@ffffe800
 (microchip,sam9x60-ddramc): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202603110135.1GX45Zkj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7109a2155340cc7b21f27e832ece6df03592f2e8
commit: f3ae0049ff8a3d2cbd8c05857705744435629d0c [3775/5327] dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema
config: arm-randconfig-2052-20260308 (https://download.01.org/0day-ci/archive/20260311/202603110135.1GX45Zkj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110135.1GX45Zkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110135.1GX45Zkj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: pwm@f8034000 (microchip,sam9x60-pwm): Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pwm/atmel,at91sam-pwm.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: hlcdc@f8038000 (microchip,sam9x60-hlcdc): 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: adc@f804c000 (microchip,sam9x60-adc): compatible: ['microchip,sam9x60-adc', 'atmel,sama5d2-adc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/atmel,sama5d2-adc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: mpddrc@ffffe800 (microchip,sam9x60-ddramc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-ddramc', 'atmel,sama5d3-ddramc'] is too long
   	'atmel,at91rm9200-sdramc' was expected
   	'microchip,sama7d65-uddrc' was expected
   	'syscon' was expected
   	'microchip,sama7g5-uddrc' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio-keys: pinctrl-key-gpio: {'atmel,pins': [[0, 29, 0, 0]], 'phandle': 37} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
--
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20 (microchip,mcp23008): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: hlcdc@f8038000 (microchip,sam9x60-hlcdc): 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: adc@f804c000 (microchip,sam9x60-adc): compatible: ['microchip,sam9x60-adc', 'atmel,sama5d2-adc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/atmel,sama5d2-adc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mpddrc@ffffe800 (microchip,sam9x60-ddramc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-ddramc', 'atmel,sama5d3-ddramc'] is too long
   	'atmel,at91rm9200-sdramc' was expected
   	'microchip,sama7d65-uddrc' was expected
   	'syscon' was expected
   	'microchip,sama7g5-uddrc' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: rtc@fffffea8 (microchip,sam9x60-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-rtc', 'atmel,at91sam9x5-rtc'] is too long
--
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: mpddrc@ffffe800 (microchip,sam9x7-ddramc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc'] is too long
   	'atmel,at91rm9200-sdramc' was expected
   	'microchip,sama7d65-uddrc' was expected
   	'syscon' was expected
   	'microchip,sama7g5-uddrc' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
