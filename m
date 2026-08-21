Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D43515DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 21:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347192; cv=none; b=nSjuRolBN9nhbNFWwdcLvvWmTzC1l8Lt0Mgr6Gw8ZEIad5v+ZL8eOicYpTE4xtno7JEe8oovsKvyMoOzIQvs0ACBY2R66644ov0aUEW3mhRQyGhfdCTpU0k+wljbZrIw6Gp39xytbUiIao3+bq7qp9ozjoZ/M2isBbS+9vLrBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347192; c=relaxed/simple;
	bh=SiDjdBz14kOgsEnNf+x+z3gdlwt6j3IluBQy94HuAtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7ij3e4tYanBMfz1YAq6XqqX7RsELnYZzpwNLynmb3M42pestzpA5Lg6PmZfkZbDw9nsv443/GVLFfdpfgvkXL4P08KWv7tfQNfqHF9+0Cf/G+/b5+S9aor4z7FA1KC28BI5fa4WnsKQtmOT3d75J0sM/FLMM3zBL2sgM/Fc5H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7EgbjED; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7EgbjED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787347190; x=1818883190;
  h=date:from:to:cc:subject:message-id;
  bh=SiDjdBz14kOgsEnNf+x+z3gdlwt6j3IluBQy94HuAtI=;
  b=d7EgbjED9dhaA5LYrktsx6+mDBcGGkTVZp4rU0GTQ+oewUuQjxocshhd
   z0/BKMKe4AyQN2DteJGIi0TGN2SUEQnJPrrXtIUmZcHpYCw8FMG2ZfGo0
   XrHlS5YTC4weWiAzvXtFr11Nklv+pmE4I0G+uIsUg2iPFpvqD1hkxkwpn
   OymayylkiDCmdmto58HqmyDHbTz/UrY1Is3dAzmmR4q670bSMk8ZeG7Mn
   gslNPjaXzi8xuJ0CzRDw7P0aEnNwN2G3VR1e7hJRcoQW9TwzJ4eeh49cx
   WrfA0USnsNZR4nJSFF88K3VgCh4jlMahvegUkXrd8HE8w+4kZjQ8ZGQHH
   w==;
X-CSE-ConnectionGUID: vY0zId0bRy6QMZFULSEIlg==
X-CSE-MsgGUID: vEmbvP3vQSiF6bsvncgV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91775456"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91775456"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:19:48 -0700
X-CSE-ConnectionGUID: RcsRKrrsR1WqrGM3kxiDsg==
X-CSE-MsgGUID: ZxkgxkLpRwuLoStCE34+Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="262729126"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2026 14:19:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxWeN-000000007kT-2vay;
	Fri, 21 Aug 2026 21:19:43 +0000
Date: Fri, 21 Aug 2026 23:19:01 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Bostina <egbostina@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 12012/16703]
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: pmic@24 (ti,tps65217):
 regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1',
 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6' do
 not match any of the regexes: '^...
Message-ID: <202608212301.rcV9jPZv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   903c1cf6dff9964e71eda98a39e2e5d442050472
commit: 95231a92250ec6d04b295b912ea42135875f6c53 [12012/16703] dt-bindings: leds: backlight: Convert TPS65217 to DT schema
config: arm-randconfig-2051-20260820 (https://download.01.org/0day-ci/archive/20260821/202608212301.rcV9jPZv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212301.rcV9jPZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608212301.rcV9jPZv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: pmic@24 (ti,tps65217): pwrbutton: False schema does not allow {'compatible': ['ti,tps65217-pwrbutton'], 'interrupts': [[2]], 'status': ['okay']}
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: pmic@24 (ti,tps65217): pwrbutton: Unevaluated properties are not allowed ('compatible', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: pmic@24 (ti,tps65217): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6' do not match any of the regexes: '^(dcdc[1-3]|ldo[1-4])$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: regulator@0: regulator-compatible: b'dcdc1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: regulator@1: regulator-compatible: b'dcdc2\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: regulator@2: regulator-compatible: b'dcdc3\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: regulator@3: regulator-compatible: b'ldo1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: pmic@24 (ti,tps65217): pwrbutton: False schema does not allow {'compatible': ['ti,tps65217-pwrbutton'], 'interrupts': [[2]], 'status': ['okay']}
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: pmic@24 (ti,tps65217): pwrbutton: Unevaluated properties are not allowed ('compatible', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: pmic@24 (ti,tps65217): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6' do not match any of the regexes: '^(dcdc[1-3]|ldo[1-4])$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: regulator@0: regulator-compatible: b'dcdc1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: regulator@1: regulator-compatible: b'dcdc2\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: regulator@2: regulator-compatible: b'dcdc3\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: regulator@3: regulator-compatible: b'ldo1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: pmic@24 (ti,tps65217): pwrbutton: False schema does not allow {'compatible': ['ti,tps65217-pwrbutton'], 'interrupts': [[2]], 'status': ['okay']}
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: pmic@24 (ti,tps65217): pwrbutton: Unevaluated properties are not allowed ('compatible', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: pmic@24 (ti,tps65217): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6' do not match any of the regexes: '^(dcdc[1-3]|ldo[1-4])$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: regulator@0: regulator-compatible: b'dcdc1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: regulator@1: regulator-compatible: b'dcdc2\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: regulator@2: regulator-compatible: b'dcdc3\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: regulator@3: regulator-compatible: b'ldo1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: tps@24 (ti,tps65217): pwrbutton: False schema does not allow {'compatible': ['ti,tps65217-pwrbutton'], 'interrupts': [[2]], 'status': ['okay']}
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: tps@24 (ti,tps65217): pwrbutton: Unevaluated properties are not allowed ('compatible', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
>> arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: tps@24 (ti,tps65217): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6' do not match any of the regexes: '^(dcdc[1-3]|ldo[1-4])$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: regulator@0: regulator-compatible: b'dcdc1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: regulator@1: regulator-compatible: b'dcdc2\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: regulator@2: regulator-compatible: b'dcdc3\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: regulator@3: regulator-compatible: b'ldo1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
