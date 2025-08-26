Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387032DE709
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233112; cv=none; b=rmyiu+RKIA85Ek5C5GBfm15Nv1b51OPISdQMpLgViej8I6kWHQdrlmbvc6InOLMpHC01R3iTdGlbhoNyEUFVvDg/5z3Rj7F92yyGTGQOM4TwtbFs7Gg1CSyJWXFrod/yNp0wPTxunXDG6q6HDaGjbadDVxaNZgS+T7uWq/evPQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233112; c=relaxed/simple;
	bh=AFLu1wiMxbCxLI9KP3MuPr7ZkI8mGF+Qcr2Q2NchCKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OIWJz/wEkpWAGqdmsdLZMFyHiAzCTa5ebWhvmBTib/bq4Ohi33GjVe2ZGEgswQOcTW9ZuqQxfXHj1jEwHNU7pjyMmhX80ih9pXu+ZwQuMKMgHP0r90qx9AQs9t7WpZmvsA5UKsBjQUwjiAzbAdXoHGG9n/rufu+pKGaS7pM1/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFkWAtQp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFkWAtQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756233109; x=1787769109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFLu1wiMxbCxLI9KP3MuPr7ZkI8mGF+Qcr2Q2NchCKU=;
  b=eFkWAtQpsnjYc3twvPBQdxY3Om6J1Pukg7HfI0xBenxEgOen2iqCc8vd
   SweMPNnuNMC+GFJzligJGN8M2ZajNOL0fBZM+3nAzLGGIw87qe8hbOjPT
   NbXO2ZJV5MIOVvbrvQwYx91jgUyhuHdpI7KPFjnTLLfMsWVifjrEyrrCX
   oK6Nmmsq3MGnCtnRGbFdrgZW+vN+FIWDuyvFKTahp73eZ/HFEv8uUZ0tK
   89+4oyVGgP7PCPlNdEn91V/69St/Z/AUSY16hK/PH9IjgHIRS3GFOIVg+
   QcwmswY3W9xv+33y7NnBkJdOedgvBzT3/v7NGtNi4YVTU64iH6aN12dr7
   A==;
X-CSE-ConnectionGUID: mnFPPm2kTMqhgU4M9NCL+w==
X-CSE-MsgGUID: XlKd/iZPToOBWla+TIKV/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81074958"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81074958"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 11:31:46 -0700
X-CSE-ConnectionGUID: bY2cAzhTSFWLluNh2GtdlQ==
X-CSE-MsgGUID: yJKdriM9TUazzgP4aAuDnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="168924701"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Aug 2025 11:31:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqySC-000SIJ-3C;
	Tue, 26 Aug 2025 18:31:42 +0000
Date: Wed, 27 Aug 2025 02:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: scmi (arm,scmi): 'protocol@80'
 does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508270215.5YI7wYqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: 94efcb592c94bb844f1f7d3b0600ab955addd4f4 [443/443] CHROMIUM: arm64: dts: mt8189: Add mt8189 dts evaluation board and Makefile
config: arm64-randconfig-051-20250823 (https://download.01.org/0day-ci/archive/20250827/202508270215.5YI7wYqC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270215.5YI7wYqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270215.5YI7wYqC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:685.16-688.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning (simple_bus_reg): /soc/xs-phy@11b10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1368.27-1388.5: Warning (simple_bus_reg): /soc/xs-phy@11e80000: simple-bus unit address format error, expected "11e83000"
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (simple_bus_reg): /soc/xs-phy@11e90000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (simple_bus_reg): /soc/xs-phy@11ef0000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1524.32-1622.5: Warning (simple_bus_reg): /soc/opp-table-gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2548.32-2856.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2858.10-2861.5: Warning (simple_bus_reg): /soc/emiisu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:439.37-459.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:461.29-465.5: Warning (unique_unit_address_if_enabled): /soc/syscon@d01a000: duplicate unit-address (also used in node /soc/soc-dbg-error-flag@d01a000)
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[27, 10], [30, 25], [30, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/pwm@1100e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[30, 72], [27, 73], [27, 74], [27, 75], [27, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/usb@11210000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11220000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11220000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[30, 15], [27, 61], [27, 60], [30, 14], [27, 64], [27, 63], [30, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[30, 18], [27, 66], [27, 65], [30, 19], [27, 68], [27, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[30, 18], [27, 66], [27, 65], [30, 19], [27, 68], [27, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: usb@11270000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[30, 42], [2], [30, 173], [30, 41], [30, 43], [41, 0], [41, 1], [41, 2], [41, 3], [41, 4], [41, 5], [42, 0], [42, 1], [42, 2], [42, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[53], [54], [55]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[60, 133], [60, 134], [60, 135], [60, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[69, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[60, 143], [60, 144], [60, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[82, 0], [82, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[82, 1], [82, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
