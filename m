Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548C18CBFE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 17:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616449; cv=none; b=fXiexhmnpYaMt7AT7Ed5+vGesjztSCaZezAkWZtligpBN8bl6QZ6V958hh7WNLs0aZkaN3peKyOO7k1LmwopPsGmuQZNoZlRiezoeJv2Bce1w2hHecRco2FrPRaN/7HVimuHx/jTmRzPiaZFR7wqn5/zGgLM3DZnERDh2kCqoQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616449; c=relaxed/simple;
	bh=PSPJEB9lC8/ZBWBI+dArF91fVf7ERPa6Q4PYqMgv6jg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJbp9GgHFULJvdGJoZW14Ag4XsqAUsRTTw0VTIfzw+RuW7fYAGUnEjuJw+9q1tR8xVcso4EiSt1LVBddTmTcdlxKFNOD+gm1aEL2JbxaPq+wDUoXfzyLXQt08QWhy9fO1j82M4VMH47qVtFQlj9DYLaObXckD9ZrhQKzZ/w+klY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrFUl+B6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrFUl+B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736616446; x=1768152446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PSPJEB9lC8/ZBWBI+dArF91fVf7ERPa6Q4PYqMgv6jg=;
  b=WrFUl+B6tiE9J3Ye9jKMFsvtFFgbAlxXiLkBOmBZ3R+RSvg23kh1zf2X
   wuES9AO+2HMza5+mHW4e4T15rcGusZP3Ontp15AxRwHSC+zYlv4mUhpL0
   1lvn8IXgn4i3sD87lsA1ARTrJqwu+UhkNuBVCVsIYq+Y1b7oajzSeaWKN
   m5QCgtyIfWvSF9fOLraM1p/i0QdhRpIMRXd8Wi+UbRWqB42V0DDAUk7nb
   bVqGuCkqHpOyrTBlFG/L8YVZIdxjfVsbG9cJsPiXz6WeqKeogM0xS0Dr6
   Lxn/luQ3/cPwnFLuO0QBK6yKXzoAAStUw6567Cd/XmPZbJTevoTWFhmMP
   w==;
X-CSE-ConnectionGUID: ajoKlmD5SF2GnFg5Eb3GDw==
X-CSE-MsgGUID: Du9z3SuoQm+4Tfzfc0Su7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37055288"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="37055288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 09:27:25 -0800
X-CSE-ConnectionGUID: nQJDj0bNSzGvlnrxGOJJtA==
X-CSE-MsgGUID: 1aYG8NSTQzCG2zhGGXwSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127306463"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 09:27:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWfGZ-000L2x-3D;
	Sat, 11 Jan 2025 17:27:20 +0000
Date: Sun, 12 Jan 2025 01:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 215/215]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: failed to match any schema
 with compatible: ['mediatek,mt8196-evb', 'mediatek,mt8196']
Message-ID: <202501120156.yquTNREh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   16238f5ec7ba336a27926d39b4be10a385e94cf7
commit: 3a88be543121017097505213a7494def9c514427 [215/215] CHROMIUM: arm64: dts: mt8196: Add MT8196 EVB dts
config: arm64-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250112/202501120156.yquTNREh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120156.yquTNREh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120156.yquTNREh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:568.37-593.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8196-evb', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8196-evb', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: idle-states: entry-method:0: 'psci' was expected
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: idle-states: 'clusteroff-b', 'clusteroff-l', 'clusteroff-m', 'cpuoff-b', 'cpuoff-l', 'cpuoff-m', 'mcusysoff-b', 'mcusysoff-l', 'mcusysoff-m', 's2idle', 'system-vcore' do not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: $nodename:0: 'clk-ao' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: performance-controller@c2c0f20: reg: [[0, 204214048, 0, 288], [0, 204214336, 0, 288], [0, 204214624, 0, 288]] is too long
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: performance-controller@c2c0f20: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8196-infracfg-ao', 'mediatek,mt8196-infracfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8196-infracfg-ao', 'mediatek,mt8196-infracfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@120a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@120a0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@120c0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-e', 'mediatek,mt8196-imp_iic_wrap_e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@120c0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-e', 'mediatek,mt8196-imp_iic_wrap_e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13130000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13150000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13190000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@131b0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-w', 'mediatek,mt8196-imp_iic_wrap_w', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@131b0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-w', 'mediatek,mt8196-imp_iic_wrap_w', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13930000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13930000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@139b0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@139b0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13a30000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13a30000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13ab0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13ab0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13b30000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13b30000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13bb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13bb0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@13c30000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-n', 'mediatek,mt8196-imp_iic_wrap_n', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@13c30000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-n', 'mediatek,mt8196-imp_iic_wrap_n', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14500000: failed to match any schema with compatible: ['mediatek,mt8196-hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/serial@16030000: failed to match any schema with compatible: ['mediatek,mt6985-uart']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16110000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16130000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16150000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16170000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16190000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@161b0000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@161d0000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@161f0000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@16200000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@16280000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@162c0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@162c0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16300000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-c', 'mediatek,mt8196-imp_iic_wrap_c', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16300000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-c', 'mediatek,mt8196-imp_iic_wrap_c', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16310000: clocks: [[37, 31], [32, 48], [32, 46], [32, 44], [32, 50]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16310000: clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16310000: clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16310000: clock-names: ['source', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clocks: [[37, 32], [32, 56], [32, 54], [32, 52], [32, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clock-names: ['source', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16640000: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao', 'mediatek,mt8196-pericfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16640000: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao', 'mediatek,mt8196-pericfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-audiosys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@1c004000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c00d000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,mt6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/watchdog@1c010000: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32000000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys0', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32400000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3602f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38000000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38800000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1', 'mediatek,mt8196-vencsys_c1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38800000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1', 'mediatek,mt8196-vencsys_c1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'mediatek,mt8196-vencsys_c2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'mediatek,mt8196-vencsys_c2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3a000000: failed to match any schema with compatible: ['mediatek,mt8196-cam_main-r1a', 'mediatek,mt8196-cam_main_r1a', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3a000000: failed to match any schema with compatible: ['mediatek,mt8196-cam_main-r1a', 'mediatek,mt8196-cam_main_r1a', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e000000: failed to match any schema with compatible: ['mediatek,mt8196-mdpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e400000: failed to match any schema with compatible: ['mediatek,mt8196-mdpsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e800000: failed to match any schema with compatible: ['mediatek,mt8196-disp-vdisp-ao-config', 'mediatek,mt8196-disp_vdisp_ao_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e800000: failed to match any schema with compatible: ['mediatek,mt8196-disp-vdisp-ao-config', 'mediatek,mt8196-disp_vdisp_ao_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
