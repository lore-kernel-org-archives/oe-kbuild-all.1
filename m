Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81C38F656
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683563; cv=none; b=BsMscW4E0Pc7fNOJSBlkb9rFxvUXloQTW2X71AGQ3gLcoDcvZpig84T+jdvX9Jn/l/PtF5ElW1hKs9Q8AuRTjkfevHczpXGizOzvjSJHGAb9k0BqaDYj2dmzW1pIMJFZOERdZAD+KqrWv1Fh5sAOId7hHGRutal6qnyptDTiX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683563; c=relaxed/simple;
	bh=2LvfYBItYBjFFpInddPhtGQVyaPsJUkI3hONLqZqBKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ogzurma0f4pEyFSwIbzaoY1lWzfgt4OoZpUsgIvA/TV+u7yCsFZlmmDhLkGXN1VXuwF1SGrZ1i4AtwFckX6tbdLLy9OeVjnDgMNFyDJlVejacLEzaMV45kEN+rRRRLhS5Vs9Y+HDG1sj+SbjPEkiOEjCYzvAD1SFgr2WXnTuEKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjCTw2Q6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjCTw2Q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780683561; x=1812219561;
  h=date:from:to:cc:subject:message-id;
  bh=2LvfYBItYBjFFpInddPhtGQVyaPsJUkI3hONLqZqBKk=;
  b=WjCTw2Q6ufuQPbe8TxnM1YsAQ21RUI+akCeiPLVSZlS969zRmsKuEEtm
   WX/xS6G9N3ixvAMd92uKjl5rxaaJmHldaYWuhuBYmVwCe21n5uItA13qg
   5w5RDrGQUcFYkTNQEl0j+5UXp2C+jYuIxyV59rrJP4TjXUvzzFXp8NLrE
   RAWAX+ZjWI0pWiVDLhZkkHlWnXxlW82j1WIfQVubyv9DvWa0yU3cjVAja
   JmlRvsyQmu6rgQzW7NNFyc4vJgi8f3lgaHB3jteMCp6WVDCtNrgndI+IE
   UfavdzqL3t2GFuEO7dUyfLn3/82ZUtpA+fXmJ0ZIWR0B5OIRShDCGVd/N
   Q==;
X-CSE-ConnectionGUID: RRsXlUr8QLuBYJO8dknlgw==
X-CSE-MsgGUID: bp0SNgY9QrSa74RNpw49cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="69054002"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="69054002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:19:21 -0700
X-CSE-ConnectionGUID: A7uhLF6ORX2GdHa8MxOWPQ==
X-CSE-MsgGUID: cP1ebsM6TNSlAoPsccwu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="275139494"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2026 11:19:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVZ8X-000000002d7-0rWS;
	Fri, 05 Jun 2026 18:19:17 +0000
Date: Fri, 05 Jun 2026 20:19:08 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 8480/11439]
 arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: front-camera@48
 (aptina,mi1040): 'orientation' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202606052028.RIswOycL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b99ae45861eccff1e1d8c7b05a13650be805d437
commit: 34d89435081d07b052dd522a57054132dada5400 [8480/11439] ARM: tegra: transformer: Add support for front camera
config: arm-randconfig-2051-20260531 (https://download.01.org/0day-ci/archive/20260605/202606052028.RIswOycL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052028.RIswOycL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052028.RIswOycL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:54.22-60.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1224.15-1236.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:54.22-60.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1224.15-1236.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:54.22-60.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1224.15-1236.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:54.22-60.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1224.15-1236.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
