Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DC1CAA78
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835001; cv=none; b=AJHKYOsSkkyOzkvcEqER5qX50z6OuL9HxDc9Aa8kbYluJUcJEZwFMkBCfU2ojusOC3SSpW3aTvGqleve+zJh+/ktZTlngzkYmkG+Oa+YGzFR/2EbBDFvxfyVV5IgYkPnqSgFnGjiox42Y4shkqh9cpZ6qNJm0RtEYcf7Sd9wlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835001; c=relaxed/simple;
	bh=1+tI6hfrlsimgS9uYgI4PjD6/ud2j0Lz7wm8cMzTfps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cOGicMoqquODIIcMvcwASUOnFbjrtBCmIBcrZXTFvCvxt7lGT+hNExfb8MXpLvTh8Orla2tHID0EC/2PLHmTzHd3JReA2TNbNlcveLPRsN96HeoXtXU2SxTBD4eqvJL9dvNZS7y9JR1jTZcbheRzMWXKBBfUbgr+owhChq6R9lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDbiUFlY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDbiUFlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770835000; x=1802371000;
  h=date:from:to:cc:subject:message-id;
  bh=1+tI6hfrlsimgS9uYgI4PjD6/ud2j0Lz7wm8cMzTfps=;
  b=lDbiUFlYlrHalAL0GEngjT+eBRTvaZB2+dv0OLS+T/UyMZysvN50SZ39
   wKeKF1V3GRVIfwRilq2gECnhqI7LBuDcYVwM434CWR+Kp/Q+X+d1gwd2N
   G8XytnY0gWcsl2Ck+Yzu9zzLbz6ObtkD4MFIUWXxuBMf4Du7qf5W28NSg
   IE313o36bSNrARU01HYGt6hYMhT+XaHRW8zzh3vdl6nkJqf4ii2ihmpD5
   a+Rtx3dhNZA0AafdlrUOF7wSigXSv3VvSSQLlzRGIypPqhu3Wpt1YtJBO
   nE1uxPr3ozatz1soqZu5/Gp1xpqBCn1kAYAVldPP08iugRRgslntppEBJ
   Q==;
X-CSE-ConnectionGUID: WvfHA+R8TVu7kDzgaUgCNA==
X-CSE-MsgGUID: LslPACeHTGGSXJj3aOn6Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89399615"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="89399615"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 10:36:30 -0800
X-CSE-ConnectionGUID: ruZId+yoSsC3+RflSlBOAQ==
X-CSE-MsgGUID: jU8sHgAmSgOhjtu+Y3ddAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216834660"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2026 10:36:28 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqF4b-00000000185-3Xh8;
	Wed, 11 Feb 2026 18:36:25 +0000
Date: Wed, 11 Feb 2026 19:36:20 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 10104/12487]
 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb:
 pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11',
 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@8', 'fan@9' do not match any of
 the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
Message-ID: <202602111931.iXQvL4Hf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd9678829d6dd0c10fde080b536abf4b1121c346
commit: 75cf411b02a7afe19dc473b4d3b3cec8680f7b14 [10104/12487] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema
config: arm-randconfig-2051-20260210 (https://download.01.org/0day-ci/archive/20260211/202602111931.iXQvL4Hf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111931.iXQvL4Hf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111931.iXQvL4Hf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/bus@1e78a000/i2c@1c0/psu@58: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/bus@1e78a000/i2c@1c0/psu@59: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: leds (gpio-leds): 'fault', 'identify' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: 'output' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: leds (gpio-leds): 'fault', 'heartbeat' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@16', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/bus@1e78a000/i2c@80/VR@45: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: leds (gpio-leds): 'fault', 'heartbeat' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: pca9552@60 (nxp,pca9552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@28: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@29: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@2d: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: leds (gpio-leds): 'fan0', 'fan1', 'fan2', 'fan3', 'fan4', 'front-fault', 'front-id', 'power-button' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
