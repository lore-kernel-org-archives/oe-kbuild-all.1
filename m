Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B57D13A86C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734908706; cv=none; b=MkQ1dNMnN4pRZ9K02A6MnkbD1oLnEtnWry+Tk/qCM3NYZLgscB737pZIPlRz0l0os1LFYLRji+Wjc9Ccyvzz3PYGeziNs7499K5WG2/mysFe53azO0SVnuv/EU0COxlanzkV7DBEbAEUzPNsgeJC1yFE5+uN5bHxJvHA3tgCl6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734908706; c=relaxed/simple;
	bh=nhb9Boct6sgIUOJjciq6KpJgW+vrgpBIEEeIQEMS4Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qg4XA4fhcFGk0sLKkfdQ1BjWeeY7YEKFwipI0zo1SNT5WH9F8tZo0Wjn+g8LQLiBtd0Zd+q1ptNKeVTZXfEMBnuKD0FC0U+UWFxIc9RIMWlcGNQbe8CMov6tfIpuIDfbmdPCP0/rQ45IDJVSUq0iCxykBQe4T9ob2NuSfeXx+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaneoGuf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaneoGuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734908705; x=1766444705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhb9Boct6sgIUOJjciq6KpJgW+vrgpBIEEeIQEMS4Go=;
  b=EaneoGufNc2gosF8C1VUTDvfir3QtUGH08T49iF2QVBVXox73Bb1LY+p
   NyaN54FNNDSzDWsrX7mpkpgl/SFRdYTVIkm18Gn9Iy0g51rSjDdF/YMOu
   iYndP08XfPxhZB2jgE60dzyAx9x3k1fEVqv3cvwVXxk1tu9D8r129xX+S
   V4DQAT890XSbI1Ka2ymwrTwURXDOUsYvddLO9q+DarWaavAfWSKdcfWv/
   gNBmZJyqUKN1G9KPCrqT6I4LeNOG4eVD2AyUfEgo0UVD8J54NZQDsueUb
   4cYVwcUhLMP9lBOne8rk5cmh+I8RbaTFIJhSdPItzr6CEgep2tV4oDvSc
   A==;
X-CSE-ConnectionGUID: d+uqCdesSKOn1ZJyw0gmjg==
X-CSE-MsgGUID: K0ZUevzdQ5irdD5tLdNumA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35517298"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35517298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:05:04 -0800
X-CSE-ConnectionGUID: BzNOztgxTwqVwcbBSgRATA==
X-CSE-MsgGUID: +VYD5H4MSdq+GWGnm66HDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="103910327"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2024 15:05:02 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPV0O-0003Fn-1G;
	Sun, 22 Dec 2024 23:05:00 +0000
Date: Mon, 23 Dec 2024 07:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 450/540]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb:
 lvts@1100b000: reg: [[0, 285257728, 0, 4096], [0, 287801344, 0, 4096]] is
 too long
Message-ID: <202412230718.fVGmmCvX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   76e007709ba23b69273c6c8ed1a893c1ec7b7df7
commit: 8b79d9289343efd85194c36b2b684c3063d8dca6 [450/540] CHROMIUM: arm64: dts: mt8192: add thermal zone node
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241223/202412230718.fVGmmCvX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230718.fVGmmCvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230718.fVGmmCvX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:1459.18-1465.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:1467.18-1470.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:1990.34-1994.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:430.27-503.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@11d00000/bridge@58: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:801.36-810.5: Warning (unique_unit_address_if_enabled): /soc/thermal-sensor@1100b000: duplicate unit-address (also used in node /soc/lvts@1100b000)
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:447.9-459.5: Warning (graph_child_address): /soc/i2c@11d00000/bridge@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:470.11-481.7: Warning (graph_child_address): /soc/i2c@11d00000/bridge@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:489.11-500.7: Warning (graph_child_address): /soc/i2c@11d00000/bridge@58/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: lvts@1100b000: reg: [[0, 285257728, 0, 4096], [0, 287801344, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: lvts@1100b000: interrupts: [[0, 169, 4, 0], [0, 170, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: lvts@1100b000: #thermal-sensor-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: lvts@1100b000: 'nvmem-cell-names', 'nvmem-cells', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: ec@0: typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: typec: connector@0:ports: 'port@0' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: i2c@11d21000: Unevaluated properties are not allowed ('clock-stretch-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: gpu@13000000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/gpu@13000000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/gpu@13000000/power_model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: dpi@14016000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: dpi@14016000: Additional properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: thermal-zones: 'apu', 'camsys', 'cci1', 'cci2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'gpu1', 'gpu2', 'infra', 'md1', 'md2', 'md3', 'mlda', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:1459.18-1465.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:1467.18-1470.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:1990.34-1994.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:430.27-503.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@11d00000/bridge@58: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8192.dtsi:801.36-810.5: Warning (unique_unit_address_if_enabled): /soc/thermal-sensor@1100b000: duplicate unit-address (also used in node /soc/lvts@1100b000)
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:447.9-459.5: Warning (graph_child_address): /soc/i2c@11d00000/bridge@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:470.11-481.7: Warning (graph_child_address): /soc/i2c@11d00000/bridge@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:489.11-500.7: Warning (graph_child_address): /soc/i2c@11d00000/bridge@58/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: lvts@1100b000: reg: [[0, 285257728, 0, 4096], [0, 287801344, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: lvts@1100b000: interrupts: [[0, 169, 4, 0], [0, 170, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: lvts@1100b000: #thermal-sensor-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: lvts@1100b000: 'nvmem-cell-names', 'nvmem-cells', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: ec@0: typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: typec: connector@0:ports: 'port@0' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: i2c@11d21000: Unevaluated properties are not allowed ('clock-stretch-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: gpu@13000000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/gpu@13000000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/gpu@13000000/power_model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: dpi@14016000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: dpi@14016000: Additional properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: thermal-zones: 'apu', 'camsys', 'cci1', 'cci2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'gpu1', 'gpu2', 'infra', 'md1', 'md2', 'md3', 'mlda', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
