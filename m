Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD825949F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 02:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734660266; cv=none; b=LYuvhrDEQFwgztO/QDvH1dAOX17nDE4KiWY/eX3L7tjS9BZUjxMhE5bJFr3eoMJV23KFerUbTr6M5OnVwX+PosXYwbl18HXIJN1j4kjrtMj1ZAtm+QGPp+64ZOyZJAgcGdCeu7vZ5pWaFlrIsaiOmI6VUJCLlhgtsA6JKAYRoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734660266; c=relaxed/simple;
	bh=aKQRZYSxwk0VkiN2wujwhepyJsAMP8f0uoVBodgLh3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CoXinyBRCvKheh+5AF2ZHVJhvuGd6oBOd7UmWo2iqeYwST+hDVQTMQuENGeJxRBM0zaejx526XiRWxlUoXbF0irljXEHXvdO35ZVqN0Yxv4st4ItlDOP3rJ5wukQgv5Estr5aiFyjmmQmrjGnXg/30SjdNQ9NP1TnEkZVU66nPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URuqc6p0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URuqc6p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734660262; x=1766196262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aKQRZYSxwk0VkiN2wujwhepyJsAMP8f0uoVBodgLh3A=;
  b=URuqc6p0wsrXR2pxi70zMH0QLiOhWUh/02SueLylJ1oMOBrM+a3jE1vm
   oahxq5GOVPEwnMHewZ43TBAHCy7KPHe1paf5Cy1Nwes9iQXU1+WUC5Vb1
   Mo/cki0fUO7lr+R4ey+ushibz2LKeYYhihT2+Doaqsw2YJyFUoPKDyYVC
   +eqydNgygSNK/rPN+9wCHwuQmhTm75MhVKf1TasjM/XQlvYdGmyCfFE1J
   OceZrY4rljDu3cUjSGcVVUMBO9j8MSv4GHi4SlGUpkRkyVm8DOR9EAHeu
   nmPDDsmbVI/Noh46eATU47PgFmw8TbNinje8u2xqL9eNTQdvZn59/6ZFa
   g==;
X-CSE-ConnectionGUID: qTFs4/rSRN+wrROoWrLfXQ==
X-CSE-MsgGUID: JtTS09hiTT+bvvtbn8SjaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35348726"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35348726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 18:04:21 -0800
X-CSE-ConnectionGUID: RY4kjrrkRrGKb1GW4o4N8w==
X-CSE-MsgGUID: Z6vZkEg8SRC/0ZaZldDX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103374645"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2024 18:04:18 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOSNE-0000gN-19;
	Fri, 20 Dec 2024 02:04:16 +0000
Date: Fri, 20 Dec 2024 10:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 433/540]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c:
 Unevaluated properties are not allowed ('hpd-gpios', 'interrupts',
 'no-laneswap', 'port' were unexpected)
Message-ID: <202412200929.ubjsD2Ac-lkp@intel.com>
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
commit: 55500342cfdb02f5550481df77c2d3a541b73e93 [433/540] CHROMIUM: arm64: dts: add it6505 node and dpi node
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241220/202412200929.ubjsD2Ac-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200929.ubjsD2Ac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200929.ubjsD2Ac-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'da7219_pins', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'da7219_pins', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'da7219_pins', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_main: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: sensor_sub: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: i2c@11009000: Unevaluated properties are not allowed ('camera_main_af', 'sensor_main' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/i2c@11009000/sensor_main: failed to match any schema with compatible: ['galaxycore,gc5035']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: sensor_sub: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: i2c@11009000: Unevaluated properties are not allowed ('camera_main_af', 'sensor_main' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/i2c@11009000/sensor_main: failed to match any schema with compatible: ['galaxycore,gc5035']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_main: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
