Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986461A2C11
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733887; cv=none; b=Wm2MzC6HRmaOeeoNLnbYM7jtoV+rrp4McnZ9bDmuZFyoqhsJk24jFk44if9U3bjjdnX7GEbgoGdNXWZUrMvfg1wJ8WeRdZyhGM6IlY/R+JOjsp/t5sW8BzJz1TN4jh10WNXMz+47E+J0CffycQ8Z/kr/v7RJvDzHL8QgwI9aflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733887; c=relaxed/simple;
	bh=CM1Vp+OTBDyYK/d7vTTyyGYqcbLEptVHZgDf5GCHm8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCnZ/J++W0UuQr6i/80AmB8ks2jon8us/0Rt1YST5VLP/h590ZBc/A8atKcDMmVzkacJMQokXfFHC11qExSLNxDHyLL54IYeYEOOxPyUQN4fhUHYvcU9VxuEJkQFbk+AeB1JpXiRr3sC/8dbQBIrr1Tn3jXB0ymRbffw1avHXm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWZGdc5M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWZGdc5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734733884; x=1766269884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CM1Vp+OTBDyYK/d7vTTyyGYqcbLEptVHZgDf5GCHm8c=;
  b=UWZGdc5MmM2U9KH1pNPED0kUEfvZNfPWIqr90HDTN534PCaUpZuGzwGG
   KhlG5BfB/m+QKDohiIaoFP00byKHkZuTVEjgHLqPF0tspPrS/g1CprkOy
   fkczHChUdt2ExrOnkAV1dD8FIoCTIz3/sxRYTdY5AyC7TIi1oqfQjVqsJ
   5IKFUTeqzjxmBRj8X0niqD/9iS7r2ylnFMTBz8WeERiozNgMO3MLc7npL
   c4fKggJfEVUZh62HWmhzVfz3ZmBy2m/wJboBL1YVAq8d3HnZKs08aLhIT
   DhzmPD0nMYoXp0yG+e+0VvfK5v44ovnjfJyi7pkkgGktI+ve8Xjx5Fzwo
   w==;
X-CSE-ConnectionGUID: wSjnsYHIRki7SttnJxlspQ==
X-CSE-MsgGUID: wx2uvP4nR32iWgqrVYvuPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57765469"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="57765469"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 14:31:24 -0800
X-CSE-ConnectionGUID: DgViKtGvTKOe3p3m07jZAw==
X-CSE-MsgGUID: 6ISyLf1/ThKqwB4d6Yom2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="129444492"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2024 14:31:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOlWi-0001iN-2k;
	Fri, 20 Dec 2024 22:31:20 +0000
Date: Sat, 21 Dec 2024 06:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 2791/5236]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells',
 '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202412210650.A9DwYpCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: beb06b727194f68b0a4b5183e50c88265ce185af [2791/5236] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-051-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210650.A9DwYpCQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210650.A9DwYpCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210650.A9DwYpCQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1114.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: btmrvl@2: marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1114.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2: marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1114.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2: marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
