Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B9829A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 03:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718940991; cv=none; b=TRC2OTjsJ2+7cDcsWjJAn1m6eMdNG1ffDPXitZAf5dLpPMu6c1uz60h7KKLQaAKieAQTQY4N5RibhNRdVntkNEL2snBXet9g5B204VfxKoiU4r6STvNrjdzoATdKchKHvIeSddn2gc7Tnsw/VJAtxmfrq/0hk19fc1IWMiBc9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718940991; c=relaxed/simple;
	bh=w06kvUOyZOvTSMxQ/25iEC9K/HTJqKd561sj57pV+6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvsiL3arUUNNykQBEkSbG/L2tXqtRSXaXS3bfEzFT/O7uM4uKy5nm65PIAMjfe1K6y54fV+KrvOzE/NzpGSIhGjyD/yrGiU6CJo+RvBIffHcSuy+aoElrQ8jNqfzffsNyWhJyjAeK2Vtybk07J2vMSPlhUU4O+elmcgFlTKrb4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+2QgWB7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+2QgWB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718940981; x=1750476981;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w06kvUOyZOvTSMxQ/25iEC9K/HTJqKd561sj57pV+6E=;
  b=C+2QgWB7hUaxLuuZWMXj0hE6A/icF8Km8U8If0BE30q2cnxv+iX/vDjy
   /rFgf0mW6NcJJL3pE0E3vQx6/6ahjOMpV3zdbU8osEseN0E6sWCkPVhZ+
   lSOsfHGgSECz6byK0W6RMd7x0fMM+oBStOIilz1LTUwE0f7eKRXXN3quU
   F1Ls5/2Zr7q0n/ASLNkjgYvLpvZscei7ope7Dfplg/pNdVaDmAVpJ7j6K
   84XfLsXL3ZEhtqwcffKZ/bY0O7A8nUU0+8J7eLAxKD6fQI6Yl0XmnJKCe
   zW8sheA8QMZ+hdnXl0yhlgGXHBpdn5B+xOG7DQJq3A0tDsSxndqnGCixp
   A==;
X-CSE-ConnectionGUID: WSxw4dl+QrC88x4lmOrzgw==
X-CSE-MsgGUID: ZbwALMmkQVSUYERMXZ7X5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15791061"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="15791061"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 20:36:20 -0700
X-CSE-ConnectionGUID: MSErqgg7SpOF3mZxgVcYqw==
X-CSE-MsgGUID: bSPje97KQmOtXOFsYrqGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="79970319"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 20:36:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKV4R-0008AT-2B;
	Fri, 21 Jun 2024 03:36:15 +0000
Date: Fri, 21 Jun 2024 11:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 205/206]
 arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning
 (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address
 (also used in node /soc/thermal-sensor@1100b000)
Message-ID: <202406211134.vLo3XnYW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   e31ea347868f27ec7d23fe63f6eadd79cbcbc341
commit: 1ff016a6a5f0f2e5dead118d0cf72cec373f5780 [205/206] BACKPORT: FROMGIT: arm64: dts: mediatek: mt8183: Refactor thermal zones
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240621/202406211134.vLo3XnYW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211134.vLo3XnYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211134.vLo3XnYW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'pwm1', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: gpu@13040000: 'power_model@0', 'power_model@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g72-power-model']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller0@14001000: iommus:0: [96, 6] is too long
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: touchscreen@10: {'compatible': ['hid-over-i2c'], 'reg': [[16]], 'pinctrl-names': ['default'], 'pinctrl-0': [[70]], 'interrupts-extended': [[44, 155, 8]], 'reset-gpios': [[44, 156, 1]], 'status': ['okay'], 'interrupt-parent': [[44]], 'interrupts': [[155, 8]], 'post-power-on-delay-ms': [[10]], 'hid-descr-addr': [[1]], '$nodename': ['touchscreen@10']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: touchscreen@10: {'compatible': ['hid-over-i2c'], 'reg': [[16]], 'pinctrl-names': ['default'], 'pinctrl-0': [[70]], 'interrupts-extended': [[44, 155, 8]], 'reset-gpios': [[44, 156, 1]], 'status': ['okay'], 'interrupt-parent': [[44]], 'interrupts': [[155, 8]], 'post-power-on-delay-ms': [[10]], 'hid-descr-addr': [[1]], '$nodename': ['touchscreen@10']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: touchscreen@10: {'compatible': ['hid-over-i2c'], 'reg': [[16]], 'pinctrl-names': ['default'], 'pinctrl-0': [[70]], 'interrupts-extended': [[44, 155, 8]], 'reset-gpios': [[44, 156, 1]], 'status': ['okay'], 'interrupt-parent': [[44]], 'interrupts': [[155, 8]], 'post-power-on-delay-ms': [[10]], 'hid-descr-addr': [[1]], '$nodename': ['touchscreen@10']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: touchscreen@10: {'compatible': ['hid-over-i2c'], 'reg': [[16]], 'pinctrl-names': ['default'], 'pinctrl-0': [[70]], 'interrupts-extended': [[44, 155, 8]], 'reset-gpios': [[44, 156, 1]], 'status': ['okay'], 'interrupt-parent': [[44]], 'interrupts': [[155, 8]], 'post-power-on-delay-ms': [[10]], 'hid-descr-addr': [[1]], '$nodename': ['touchscreen@10']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev0-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev0-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev3-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev3-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /: failed to match any schema with compatible: ['google,pico-sku2', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /: failed to match any schema with compatible: ['google,pico-sku2', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: touchscreen@10: {'compatible': ['hid-over-i2c'], 'reg': [[16]], 'pinctrl-names': ['default'], 'pinctrl-0': [[70]], 'interrupts-extended': [[44, 155, 8]], 'reset-gpios': [[44, 156, 1]], 'status': ['okay'], 'interrupt-parent': [[44]], 'interrupts': [[155, 8]], 'post-power-on-delay-ms': [[10]], 'hid-descr-addr': [[1]], '$nodename': ['touchscreen@10']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: touchscreen@10: {'compatible': ['hid-over-i2c'], 'reg': [[16]], 'pinctrl-names': ['default'], 'pinctrl-0': [[70]], 'interrupts-extended': [[44, 155, 8]], 'reset-gpios': [[44, 156, 1]], 'status': ['okay'], 'interrupt-parent': [[44]], 'interrupts': [[155, 8]], 'post-power-on-delay-ms': [[10]], 'hid-descr-addr': [[1]], '$nodename': ['touchscreen@10']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev1', 'google,kakadu-rev0', 'google,kakadu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev1', 'google,kakadu-rev0', 'google,kakadu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /: failed to match any schema with compatible: ['google,katsu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: thermal-zones: 'tboard1', 'tboard2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: failed to match any schema with compatible: ['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: failed to match any schema with compatible: ['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_main@36: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_main@36: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: sensor_main@36: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: sensor_sub@3d: clocks: [[19, 29], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/i2c@11009000/sensor_main@37: failed to match any schema with compatible: ['galaxycore,gc5035']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: sensor_sub@3d: clocks: [[19, 29], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/i2c@11009000/sensor_main@37: failed to match any schema with compatible: ['galaxycore,gc5035']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_main@36: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_main@36: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: sensor_main@36: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_sub@3d: clock-names: ['eclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_main@10: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_main@10: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: sensor_main@10: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1684.18-1690.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1691.18-1694.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1208.21-1218.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1985.28-1989.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2099.27-2103.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: cci: 'proc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: opp-table-0: compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: opp-table-0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /opp-table-0: failed to match any schema with compatible: ['operating-points-v2', 'operating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc1-pins-uhs:pins_clk:mediatek,pull-down-adv:0:0: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'keyboard' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: gpu@13040000: 'power_model@0', 'power_model@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g72-power-model']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller0@14001000: iommus:0: [91, 6] is too long

vim +1208 arch/arm64/boot/dts/mediatek/mt8183.dtsi

e526c9bc11f858 Ben Ho                     2019-05-27    18  
e526c9bc11f858 Ben Ho                     2019-05-27    19  / {
e526c9bc11f858 Ben Ho                     2019-05-27    20  	compatible = "mediatek,mt8183";
e526c9bc11f858 Ben Ho                     2019-05-27    21  	interrupt-parent = <&sysirq>;
e526c9bc11f858 Ben Ho                     2019-05-27    22  	#address-cells = <2>;
e526c9bc11f858 Ben Ho                     2019-05-27    23  	#size-cells = <2>;
e526c9bc11f858 Ben Ho                     2019-05-27    24  
251137b8fa97ef Qii Wang                   2019-08-22    25  	aliases {
251137b8fa97ef Qii Wang                   2019-08-22    26  		i2c0 = &i2c0;
251137b8fa97ef Qii Wang                   2019-08-22    27  		i2c1 = &i2c1;
251137b8fa97ef Qii Wang                   2019-08-22    28  		i2c2 = &i2c2;
251137b8fa97ef Qii Wang                   2019-08-22    29  		i2c3 = &i2c3;
251137b8fa97ef Qii Wang                   2019-08-22    30  		i2c4 = &i2c4;
251137b8fa97ef Qii Wang                   2019-08-22    31  		i2c5 = &i2c5;
251137b8fa97ef Qii Wang                   2019-08-22    32  		i2c6 = &i2c6;
251137b8fa97ef Qii Wang                   2019-08-22    33  		i2c7 = &i2c7;
251137b8fa97ef Qii Wang                   2019-08-22    34  		i2c8 = &i2c8;
251137b8fa97ef Qii Wang                   2019-08-22    35  		i2c9 = &i2c9;
251137b8fa97ef Qii Wang                   2019-08-22    36  		i2c10 = &i2c10;
251137b8fa97ef Qii Wang                   2019-08-22    37  		i2c11 = &i2c11;
91f9c963ce79fc Enric Balletbo i Serra     2020-11-27    38  		ovl0 = &ovl0;
91f9c963ce79fc Enric Balletbo i Serra     2020-11-27    39  		ovl-2l0 = &ovl_2l0;
91f9c963ce79fc Enric Balletbo i Serra     2020-11-27    40  		ovl-2l1 = &ovl_2l1;
91f9c963ce79fc Enric Balletbo i Serra     2020-11-27    41  		rdma0 = &rdma0;
91f9c963ce79fc Enric Balletbo i Serra     2020-11-27    42  		rdma1 = &rdma1;
251137b8fa97ef Qii Wang                   2019-08-22    43  	};
251137b8fa97ef Qii Wang                   2019-08-22    44  
95eacb24f3739d Rex-BC Chen                2022-05-16    45  	cluster0_opp: opp-table-cluster0 {
95eacb24f3739d Rex-BC Chen                2022-05-16    46  		compatible = "operating-points-v2";
95eacb24f3739d Rex-BC Chen                2022-05-16    47  		opp-shared;
95eacb24f3739d Rex-BC Chen                2022-05-16    48  		opp0-793000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    49  			opp-hz = /bits/ 64 <793000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    50  			opp-microvolt = <650000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    51  			required-opps = <&opp2_00>;
95eacb24f3739d Rex-BC Chen                2022-05-16    52  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    53  		opp0-910000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    54  			opp-hz = /bits/ 64 <910000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    55  			opp-microvolt = <687500>;
95eacb24f3739d Rex-BC Chen                2022-05-16    56  			required-opps = <&opp2_01>;
95eacb24f3739d Rex-BC Chen                2022-05-16    57  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    58  		opp0-1014000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    59  			opp-hz = /bits/ 64 <1014000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    60  			opp-microvolt = <718750>;
95eacb24f3739d Rex-BC Chen                2022-05-16    61  			required-opps = <&opp2_02>;
95eacb24f3739d Rex-BC Chen                2022-05-16    62  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    63  		opp0-1131000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    64  			opp-hz = /bits/ 64 <1131000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    65  			opp-microvolt = <756250>;
95eacb24f3739d Rex-BC Chen                2022-05-16    66  			required-opps = <&opp2_03>;
95eacb24f3739d Rex-BC Chen                2022-05-16    67  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    68  		opp0-1248000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    69  			opp-hz = /bits/ 64 <1248000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    70  			opp-microvolt = <800000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    71  			required-opps = <&opp2_04>;
95eacb24f3739d Rex-BC Chen                2022-05-16    72  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    73  		opp0-1326000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    74  			opp-hz = /bits/ 64 <1326000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    75  			opp-microvolt = <818750>;
95eacb24f3739d Rex-BC Chen                2022-05-16    76  			required-opps = <&opp2_05>;
95eacb24f3739d Rex-BC Chen                2022-05-16    77  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    78  		opp0-1417000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    79  			opp-hz = /bits/ 64 <1417000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    80  			opp-microvolt = <850000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    81  			required-opps = <&opp2_06>;
95eacb24f3739d Rex-BC Chen                2022-05-16    82  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    83  		opp0-1508000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    84  			opp-hz = /bits/ 64 <1508000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    85  			opp-microvolt = <868750>;
95eacb24f3739d Rex-BC Chen                2022-05-16    86  			required-opps = <&opp2_07>;
95eacb24f3739d Rex-BC Chen                2022-05-16    87  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    88  		opp0-1586000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    89  			opp-hz = /bits/ 64 <1586000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    90  			opp-microvolt = <893750>;
95eacb24f3739d Rex-BC Chen                2022-05-16    91  			required-opps = <&opp2_08>;
95eacb24f3739d Rex-BC Chen                2022-05-16    92  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    93  		opp0-1625000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    94  			opp-hz = /bits/ 64 <1625000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16    95  			opp-microvolt = <906250>;
95eacb24f3739d Rex-BC Chen                2022-05-16    96  			required-opps = <&opp2_09>;
95eacb24f3739d Rex-BC Chen                2022-05-16    97  		};
95eacb24f3739d Rex-BC Chen                2022-05-16    98  		opp0-1677000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16    99  			opp-hz = /bits/ 64 <1677000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   100  			opp-microvolt = <931250>;
95eacb24f3739d Rex-BC Chen                2022-05-16   101  			required-opps = <&opp2_10>;
95eacb24f3739d Rex-BC Chen                2022-05-16   102  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   103  		opp0-1716000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   104  			opp-hz = /bits/ 64 <1716000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   105  			opp-microvolt = <943750>;
95eacb24f3739d Rex-BC Chen                2022-05-16   106  			required-opps = <&opp2_11>;
95eacb24f3739d Rex-BC Chen                2022-05-16   107  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   108  		opp0-1781000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   109  			opp-hz = /bits/ 64 <1781000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   110  			opp-microvolt = <975000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   111  			required-opps = <&opp2_12>;
95eacb24f3739d Rex-BC Chen                2022-05-16   112  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   113  		opp0-1846000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   114  			opp-hz = /bits/ 64 <1846000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   115  			opp-microvolt = <1000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   116  			required-opps = <&opp2_13>;
95eacb24f3739d Rex-BC Chen                2022-05-16   117  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   118  		opp0-1924000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   119  			opp-hz = /bits/ 64 <1924000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   120  			opp-microvolt = <1025000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   121  			required-opps = <&opp2_14>;
95eacb24f3739d Rex-BC Chen                2022-05-16   122  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   123  		opp0-1989000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   124  			opp-hz = /bits/ 64 <1989000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   125  			opp-microvolt = <1050000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   126  			required-opps = <&opp2_15>;
95eacb24f3739d Rex-BC Chen                2022-05-16   127  		};	};
95eacb24f3739d Rex-BC Chen                2022-05-16   128  
95eacb24f3739d Rex-BC Chen                2022-05-16   129  	cluster1_opp: opp-table-cluster1 {
95eacb24f3739d Rex-BC Chen                2022-05-16   130  		compatible = "operating-points-v2";
95eacb24f3739d Rex-BC Chen                2022-05-16   131  		opp-shared;
95eacb24f3739d Rex-BC Chen                2022-05-16   132  		opp1-793000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   133  			opp-hz = /bits/ 64 <793000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   134  			opp-microvolt = <700000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   135  			required-opps = <&opp2_00>;
95eacb24f3739d Rex-BC Chen                2022-05-16   136  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   137  		opp1-910000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   138  			opp-hz = /bits/ 64 <910000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   139  			opp-microvolt = <725000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   140  			required-opps = <&opp2_01>;
95eacb24f3739d Rex-BC Chen                2022-05-16   141  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   142  		opp1-1014000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   143  			opp-hz = /bits/ 64 <1014000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   144  			opp-microvolt = <750000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   145  			required-opps = <&opp2_02>;
95eacb24f3739d Rex-BC Chen                2022-05-16   146  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   147  		opp1-1131000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   148  			opp-hz = /bits/ 64 <1131000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   149  			opp-microvolt = <775000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   150  			required-opps = <&opp2_03>;
95eacb24f3739d Rex-BC Chen                2022-05-16   151  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   152  		opp1-1248000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   153  			opp-hz = /bits/ 64 <1248000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   154  			opp-microvolt = <800000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   155  			required-opps = <&opp2_04>;
95eacb24f3739d Rex-BC Chen                2022-05-16   156  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   157  		opp1-1326000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   158  			opp-hz = /bits/ 64 <1326000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   159  			opp-microvolt = <825000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   160  			required-opps = <&opp2_05>;
95eacb24f3739d Rex-BC Chen                2022-05-16   161  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   162  		opp1-1417000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   163  			opp-hz = /bits/ 64 <1417000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   164  			opp-microvolt = <850000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   165  			required-opps = <&opp2_06>;
95eacb24f3739d Rex-BC Chen                2022-05-16   166  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   167  		opp1-1508000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   168  			opp-hz = /bits/ 64 <1508000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   169  			opp-microvolt = <875000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   170  			required-opps = <&opp2_07>;
95eacb24f3739d Rex-BC Chen                2022-05-16   171  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   172  		opp1-1586000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   173  			opp-hz = /bits/ 64 <1586000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   174  			opp-microvolt = <900000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   175  			required-opps = <&opp2_08>;
95eacb24f3739d Rex-BC Chen                2022-05-16   176  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   177  		opp1-1625000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   178  			opp-hz = /bits/ 64 <1625000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   179  			opp-microvolt = <912500>;
95eacb24f3739d Rex-BC Chen                2022-05-16   180  			required-opps = <&opp2_09>;
95eacb24f3739d Rex-BC Chen                2022-05-16   181  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   182  		opp1-1677000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   183  			opp-hz = /bits/ 64 <1677000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   184  			opp-microvolt = <931250>;
95eacb24f3739d Rex-BC Chen                2022-05-16   185  			required-opps = <&opp2_10>;
95eacb24f3739d Rex-BC Chen                2022-05-16   186  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   187  		opp1-1716000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   188  			opp-hz = /bits/ 64 <1716000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   189  			opp-microvolt = <950000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   190  			required-opps = <&opp2_11>;
95eacb24f3739d Rex-BC Chen                2022-05-16   191  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   192  		opp1-1781000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   193  			opp-hz = /bits/ 64 <1781000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   194  			opp-microvolt = <975000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   195  			required-opps = <&opp2_12>;
95eacb24f3739d Rex-BC Chen                2022-05-16   196  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   197  		opp1-1846000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   198  			opp-hz = /bits/ 64 <1846000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   199  			opp-microvolt = <1000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   200  			required-opps = <&opp2_13>;
95eacb24f3739d Rex-BC Chen                2022-05-16   201  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   202  		opp1-1924000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   203  			opp-hz = /bits/ 64 <1924000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   204  			opp-microvolt = <1025000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   205  			required-opps = <&opp2_14>;
95eacb24f3739d Rex-BC Chen                2022-05-16   206  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   207  		opp1-1989000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   208  			opp-hz = /bits/ 64 <1989000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   209  			opp-microvolt = <1050000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   210  			required-opps = <&opp2_15>;
95eacb24f3739d Rex-BC Chen                2022-05-16   211  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   212  	};
95eacb24f3739d Rex-BC Chen                2022-05-16   213  
95eacb24f3739d Rex-BC Chen                2022-05-16   214  	cci_opp: opp-table-cci {
95eacb24f3739d Rex-BC Chen                2022-05-16   215  		compatible = "operating-points-v2";
95eacb24f3739d Rex-BC Chen                2022-05-16   216  		opp-shared;
95eacb24f3739d Rex-BC Chen                2022-05-16   217  		opp2_00: opp-273000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   218  			opp-hz = /bits/ 64 <273000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   219  			opp-microvolt = <650000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   220  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   221  		opp2_01: opp-338000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   222  			opp-hz = /bits/ 64 <338000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   223  			opp-microvolt = <687500>;
95eacb24f3739d Rex-BC Chen                2022-05-16   224  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   225  		opp2_02: opp-403000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   226  			opp-hz = /bits/ 64 <403000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   227  			opp-microvolt = <718750>;
95eacb24f3739d Rex-BC Chen                2022-05-16   228  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   229  		opp2_03: opp-463000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   230  			opp-hz = /bits/ 64 <463000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   231  			opp-microvolt = <756250>;
95eacb24f3739d Rex-BC Chen                2022-05-16   232  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   233  		opp2_04: opp-546000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   234  			opp-hz = /bits/ 64 <546000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   235  			opp-microvolt = <800000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   236  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   237  		opp2_05: opp-624000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   238  			opp-hz = /bits/ 64 <624000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   239  			opp-microvolt = <818750>;
95eacb24f3739d Rex-BC Chen                2022-05-16   240  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   241  		opp2_06: opp-689000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   242  			opp-hz = /bits/ 64 <689000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   243  			opp-microvolt = <850000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   244  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   245  		opp2_07: opp-767000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   246  			opp-hz = /bits/ 64 <767000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   247  			opp-microvolt = <868750>;
95eacb24f3739d Rex-BC Chen                2022-05-16   248  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   249  		opp2_08: opp-845000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   250  			opp-hz = /bits/ 64 <845000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   251  			opp-microvolt = <893750>;
95eacb24f3739d Rex-BC Chen                2022-05-16   252  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   253  		opp2_09: opp-871000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   254  			opp-hz = /bits/ 64 <871000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   255  			opp-microvolt = <906250>;
95eacb24f3739d Rex-BC Chen                2022-05-16   256  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   257  		opp2_10: opp-923000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   258  			opp-hz = /bits/ 64 <923000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   259  			opp-microvolt = <931250>;
95eacb24f3739d Rex-BC Chen                2022-05-16   260  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   261  		opp2_11: opp-962000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   262  			opp-hz = /bits/ 64 <962000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   263  			opp-microvolt = <943750>;
95eacb24f3739d Rex-BC Chen                2022-05-16   264  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   265  		opp2_12: opp-1027000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   266  			opp-hz = /bits/ 64 <1027000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   267  			opp-microvolt = <975000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   268  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   269  		opp2_13: opp-1092000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   270  			opp-hz = /bits/ 64 <1092000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   271  			opp-microvolt = <1000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   272  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   273  		opp2_14: opp-1144000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   274  			opp-hz = /bits/ 64 <1144000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   275  			opp-microvolt = <1025000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   276  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   277  		opp2_15: opp-1196000000 {
95eacb24f3739d Rex-BC Chen                2022-05-16   278  			opp-hz = /bits/ 64 <1196000000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   279  			opp-microvolt = <1050000>;
95eacb24f3739d Rex-BC Chen                2022-05-16   280  		};
95eacb24f3739d Rex-BC Chen                2022-05-16   281  	};
95eacb24f3739d Rex-BC Chen                2022-05-16   282  
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   283  	cci: cci {
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   284  		compatible = "mediatek,mt8183-cci";
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   285  		clocks = <&mcucfg CLK_MCU_BUS_SEL>,
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   286  			 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   287  		clock-names = "cci", "intermediate";
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   288  		operating-points-v2 = <&cci_opp>;
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   289  	};
f3ceebeb0c9bf2 Rex-BC Chen                2022-05-16   290  
e526c9bc11f858 Ben Ho                     2019-05-27   291  	cpus {
e526c9bc11f858 Ben Ho                     2019-05-27   292  		#address-cells = <1>;
e526c9bc11f858 Ben Ho                     2019-05-27   293  		#size-cells = <0>;
e526c9bc11f858 Ben Ho                     2019-05-27   294  
e526c9bc11f858 Ben Ho                     2019-05-27   295  		cpu-map {
e526c9bc11f858 Ben Ho                     2019-05-27   296  			cluster0 {
e526c9bc11f858 Ben Ho                     2019-05-27   297  				core0 {
e526c9bc11f858 Ben Ho                     2019-05-27   298  					cpu = <&cpu0>;
e526c9bc11f858 Ben Ho                     2019-05-27   299  				};
e526c9bc11f858 Ben Ho                     2019-05-27   300  				core1 {
e526c9bc11f858 Ben Ho                     2019-05-27   301  					cpu = <&cpu1>;
e526c9bc11f858 Ben Ho                     2019-05-27   302  				};
e526c9bc11f858 Ben Ho                     2019-05-27   303  				core2 {
e526c9bc11f858 Ben Ho                     2019-05-27   304  					cpu = <&cpu2>;
e526c9bc11f858 Ben Ho                     2019-05-27   305  				};
e526c9bc11f858 Ben Ho                     2019-05-27   306  				core3 {
e526c9bc11f858 Ben Ho                     2019-05-27   307  					cpu = <&cpu3>;
e526c9bc11f858 Ben Ho                     2019-05-27   308  				};
e526c9bc11f858 Ben Ho                     2019-05-27   309  			};
e526c9bc11f858 Ben Ho                     2019-05-27   310  
e526c9bc11f858 Ben Ho                     2019-05-27   311  			cluster1 {
e526c9bc11f858 Ben Ho                     2019-05-27   312  				core0 {
e526c9bc11f858 Ben Ho                     2019-05-27   313  					cpu = <&cpu4>;
e526c9bc11f858 Ben Ho                     2019-05-27   314  				};
e526c9bc11f858 Ben Ho                     2019-05-27   315  				core1 {
e526c9bc11f858 Ben Ho                     2019-05-27   316  					cpu = <&cpu5>;
e526c9bc11f858 Ben Ho                     2019-05-27   317  				};
e526c9bc11f858 Ben Ho                     2019-05-27   318  				core2 {
e526c9bc11f858 Ben Ho                     2019-05-27   319  					cpu = <&cpu6>;
e526c9bc11f858 Ben Ho                     2019-05-27   320  				};
e526c9bc11f858 Ben Ho                     2019-05-27   321  				core3 {
e526c9bc11f858 Ben Ho                     2019-05-27   322  					cpu = <&cpu7>;
e526c9bc11f858 Ben Ho                     2019-05-27   323  				};
e526c9bc11f858 Ben Ho                     2019-05-27   324  			};
e526c9bc11f858 Ben Ho                     2019-05-27   325  		};
e526c9bc11f858 Ben Ho                     2019-05-27   326  
e526c9bc11f858 Ben Ho                     2019-05-27   327  		cpu0: cpu@0 {
e526c9bc11f858 Ben Ho                     2019-05-27   328  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   329  			compatible = "arm,cortex-a53";
e526c9bc11f858 Ben Ho                     2019-05-27   330  			reg = <0x000>;
e526c9bc11f858 Ben Ho                     2019-05-27   331  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   332  			capacity-dmips-mhz = <741>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   333  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
95eacb24f3739d Rex-BC Chen                2022-05-16   334  			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   335  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   336  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   337  			operating-points-v2 = <&cluster0_opp>;
cc10317db0d5dc michael.kao                2020-01-03   338  			dynamic-power-coefficient = <84>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   339  			i-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   340  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   341  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   342  			d-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   343  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   344  			d-cache-sets = <128>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   345  			next-level-cache = <&l2_0>;
5323e0fa9394d3 michael.kao                2020-01-03   346  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   347  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   348  		};
e526c9bc11f858 Ben Ho                     2019-05-27   349  
e526c9bc11f858 Ben Ho                     2019-05-27   350  		cpu1: cpu@1 {
e526c9bc11f858 Ben Ho                     2019-05-27   351  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   352  			compatible = "arm,cortex-a53";
e526c9bc11f858 Ben Ho                     2019-05-27   353  			reg = <0x001>;
e526c9bc11f858 Ben Ho                     2019-05-27   354  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   355  			capacity-dmips-mhz = <741>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   356  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
95eacb24f3739d Rex-BC Chen                2022-05-16   357  			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   358  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   359  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   360  			operating-points-v2 = <&cluster0_opp>;
cc10317db0d5dc michael.kao                2020-01-03   361  			dynamic-power-coefficient = <84>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   362  			i-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   363  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   364  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   365  			d-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   366  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   367  			d-cache-sets = <128>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   368  			next-level-cache = <&l2_0>;
5323e0fa9394d3 michael.kao                2020-01-03   369  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   370  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   371  		};
e526c9bc11f858 Ben Ho                     2019-05-27   372  
e526c9bc11f858 Ben Ho                     2019-05-27   373  		cpu2: cpu@2 {
e526c9bc11f858 Ben Ho                     2019-05-27   374  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   375  			compatible = "arm,cortex-a53";
e526c9bc11f858 Ben Ho                     2019-05-27   376  			reg = <0x002>;
e526c9bc11f858 Ben Ho                     2019-05-27   377  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   378  			capacity-dmips-mhz = <741>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   379  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
95eacb24f3739d Rex-BC Chen                2022-05-16   380  			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   381  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   382  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   383  			operating-points-v2 = <&cluster0_opp>;
cc10317db0d5dc michael.kao                2020-01-03   384  			dynamic-power-coefficient = <84>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   385  			i-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   386  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   387  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   388  			d-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   389  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   390  			d-cache-sets = <128>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   391  			next-level-cache = <&l2_0>;
5323e0fa9394d3 michael.kao                2020-01-03   392  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   393  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   394  		};
e526c9bc11f858 Ben Ho                     2019-05-27   395  
e526c9bc11f858 Ben Ho                     2019-05-27   396  		cpu3: cpu@3 {
e526c9bc11f858 Ben Ho                     2019-05-27   397  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   398  			compatible = "arm,cortex-a53";
e526c9bc11f858 Ben Ho                     2019-05-27   399  			reg = <0x003>;
e526c9bc11f858 Ben Ho                     2019-05-27   400  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   401  			capacity-dmips-mhz = <741>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   402  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
95eacb24f3739d Rex-BC Chen                2022-05-16   403  			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   404  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   405  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   406  			operating-points-v2 = <&cluster0_opp>;
cc10317db0d5dc michael.kao                2020-01-03   407  			dynamic-power-coefficient = <84>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   408  			i-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   409  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   410  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   411  			d-cache-size = <32768>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   412  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   413  			d-cache-sets = <128>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   414  			next-level-cache = <&l2_0>;
5323e0fa9394d3 michael.kao                2020-01-03   415  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   416  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   417  		};
e526c9bc11f858 Ben Ho                     2019-05-27   418  
e526c9bc11f858 Ben Ho                     2019-05-27   419  		cpu4: cpu@100 {
e526c9bc11f858 Ben Ho                     2019-05-27   420  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   421  			compatible = "arm,cortex-a73";
e526c9bc11f858 Ben Ho                     2019-05-27   422  			reg = <0x100>;
e526c9bc11f858 Ben Ho                     2019-05-27   423  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   424  			capacity-dmips-mhz = <1024>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   425  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   426  			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   427  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   428  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   429  			operating-points-v2 = <&cluster1_opp>;
cc10317db0d5dc michael.kao                2020-01-03   430  			dynamic-power-coefficient = <211>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   431  			i-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   432  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   433  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   434  			d-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   435  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   436  			d-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   437  			next-level-cache = <&l2_1>;
5323e0fa9394d3 michael.kao                2020-01-03   438  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   439  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   440  		};
e526c9bc11f858 Ben Ho                     2019-05-27   441  
e526c9bc11f858 Ben Ho                     2019-05-27   442  		cpu5: cpu@101 {
e526c9bc11f858 Ben Ho                     2019-05-27   443  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   444  			compatible = "arm,cortex-a73";
e526c9bc11f858 Ben Ho                     2019-05-27   445  			reg = <0x101>;
e526c9bc11f858 Ben Ho                     2019-05-27   446  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   447  			capacity-dmips-mhz = <1024>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   448  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   449  			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   450  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   451  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   452  			operating-points-v2 = <&cluster1_opp>;
cc10317db0d5dc michael.kao                2020-01-03   453  			dynamic-power-coefficient = <211>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   454  			i-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   455  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   456  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   457  			d-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   458  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   459  			d-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   460  			next-level-cache = <&l2_1>;
5323e0fa9394d3 michael.kao                2020-01-03   461  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   462  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   463  		};
e526c9bc11f858 Ben Ho                     2019-05-27   464  
e526c9bc11f858 Ben Ho                     2019-05-27   465  		cpu6: cpu@102 {
e526c9bc11f858 Ben Ho                     2019-05-27   466  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   467  			compatible = "arm,cortex-a73";
e526c9bc11f858 Ben Ho                     2019-05-27   468  			reg = <0x102>;
e526c9bc11f858 Ben Ho                     2019-05-27   469  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   470  			capacity-dmips-mhz = <1024>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   471  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   472  			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   473  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   474  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   475  			operating-points-v2 = <&cluster1_opp>;
cc10317db0d5dc michael.kao                2020-01-03   476  			dynamic-power-coefficient = <211>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   477  			i-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   478  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   479  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   480  			d-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   481  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   482  			d-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   483  			next-level-cache = <&l2_1>;
5323e0fa9394d3 michael.kao                2020-01-03   484  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   485  			mediatek,cci = <&cci>;
e526c9bc11f858 Ben Ho                     2019-05-27   486  		};
e526c9bc11f858 Ben Ho                     2019-05-27   487  
e526c9bc11f858 Ben Ho                     2019-05-27   488  		cpu7: cpu@103 {
e526c9bc11f858 Ben Ho                     2019-05-27   489  			device_type = "cpu";
e526c9bc11f858 Ben Ho                     2019-05-27   490  			compatible = "arm,cortex-a73";
e526c9bc11f858 Ben Ho                     2019-05-27   491  			reg = <0x103>;
e526c9bc11f858 Ben Ho                     2019-05-27   492  			enable-method = "psci";
cc216dfd5615f9 Hsin-Yi, Wang              2019-05-27   493  			capacity-dmips-mhz = <1024>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   494  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   495  			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
95eacb24f3739d Rex-BC Chen                2022-05-16   496  				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
95eacb24f3739d Rex-BC Chen                2022-05-16   497  			clock-names = "cpu", "intermediate";
95eacb24f3739d Rex-BC Chen                2022-05-16   498  			operating-points-v2 = <&cluster1_opp>;
cc10317db0d5dc michael.kao                2020-01-03   499  			dynamic-power-coefficient = <211>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   500  			i-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   501  			i-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   502  			i-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   503  			d-cache-size = <65536>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   504  			d-cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   505  			d-cache-sets = <256>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   506  			next-level-cache = <&l2_1>;
5323e0fa9394d3 michael.kao                2020-01-03   507  			#cooling-cells = <2>;
68163cd12ca5d8 Rex-BC Chen                2022-05-16   508  			mediatek,cci = <&cci>;
6be021b1f00d11 James Liao                 2020-01-15   509  		};
6be021b1f00d11 James Liao                 2020-01-15   510  
6be021b1f00d11 James Liao                 2020-01-15   511  		idle-states {
6be021b1f00d11 James Liao                 2020-01-15   512  			entry-method = "psci";
6be021b1f00d11 James Liao                 2020-01-15   513  
6be021b1f00d11 James Liao                 2020-01-15   514  			CPU_SLEEP: cpu-sleep {
6be021b1f00d11 James Liao                 2020-01-15   515  				compatible = "arm,idle-state";
6be021b1f00d11 James Liao                 2020-01-15   516  				local-timer-stop;
6be021b1f00d11 James Liao                 2020-01-15   517  				arm,psci-suspend-param = <0x00010001>;
6be021b1f00d11 James Liao                 2020-01-15   518  				entry-latency-us = <200>;
6be021b1f00d11 James Liao                 2020-01-15   519  				exit-latency-us = <200>;
6be021b1f00d11 James Liao                 2020-01-15   520  				min-residency-us = <800>;
6be021b1f00d11 James Liao                 2020-01-15   521  			};
6be021b1f00d11 James Liao                 2020-01-15   522  
2a7abd3efbe317 Enric Balletbo i Serra     2020-06-25   523  			CLUSTER_SLEEP0: cluster-sleep-0 {
6b55297581eaf4 Ikjoon Jang                2020-02-25   524  				compatible = "arm,idle-state";
6b55297581eaf4 Ikjoon Jang                2020-02-25   525  				local-timer-stop;
6b55297581eaf4 Ikjoon Jang                2020-02-25   526  				arm,psci-suspend-param = <0x01010001>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   527  				entry-latency-us = <250>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   528  				exit-latency-us = <400>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   529  				min-residency-us = <1000>;
6b55297581eaf4 Ikjoon Jang                2020-02-25   530  			};
2a7abd3efbe317 Enric Balletbo i Serra     2020-06-25   531  			CLUSTER_SLEEP1: cluster-sleep-1 {
6be021b1f00d11 James Liao                 2020-01-15   532  				compatible = "arm,idle-state";
6be021b1f00d11 James Liao                 2020-01-15   533  				local-timer-stop;
6be021b1f00d11 James Liao                 2020-01-15   534  				arm,psci-suspend-param = <0x01010001>;
6be021b1f00d11 James Liao                 2020-01-15   535  				entry-latency-us = <250>;
6be021b1f00d11 James Liao                 2020-01-15   536  				exit-latency-us = <400>;
6be021b1f00d11 James Liao                 2020-01-15   537  				min-residency-us = <1300>;
6be021b1f00d11 James Liao                 2020-01-15   538  			};
e526c9bc11f858 Ben Ho                     2019-05-27   539  		};
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   540  
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   541  		l2_0: l2-cache0 {
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   542  			compatible = "cache";
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   543  			cache-level = <2>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   544  			cache-size = <1048576>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   545  			cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   546  			cache-sets = <1024>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   547  			cache-unified;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   548  		};
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   549  
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   550  		l2_1: l2-cache1 {
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   551  			compatible = "cache";
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   552  			cache-level = <2>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   553  			cache-size = <1048576>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   554  			cache-line-size = <64>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   555  			cache-sets = <1024>;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   556  			cache-unified;
34a39d4764849c AngeloGioacchino Del Regno 2022-12-06   557  		};
e526c9bc11f858 Ben Ho                     2019-05-27   558  	};
e526c9bc11f858 Ben Ho                     2019-05-27   559  
6f117db4123931 Krzysztof Kozlowski        2022-04-19   560  	gpu_opp_table: opp-table-0 {
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   561  		/*
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   562  		 * Note: "operating-points-v2-mali" compatible and the
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   563  		 * opp-core-mask properties are not part of upstream
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   564  		 * binding.
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   565  		 */
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   566  
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   567  		compatible = "operating-points-v2", "operating-points-v2-mali";
a8168cebf1bca1 Nicolas Boichat            2021-05-21   568  		opp-shared;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   569  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   570  		opp-300000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   571  			opp-hz = /bits/ 64 <300000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   572  			opp-microvolt = <625000>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   573  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   574  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   575  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   576  		opp-320000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   577  			opp-hz = /bits/ 64 <320000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   578  			opp-microvolt = <631250>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   579  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   580  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   581  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   582  		opp-340000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   583  			opp-hz = /bits/ 64 <340000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   584  			opp-microvolt = <637500>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   585  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   586  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   587  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   588  		opp-360000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   589  			opp-hz = /bits/ 64 <360000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   590  			opp-microvolt = <643750>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   591  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   592  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   593  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   594  		opp-380000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   595  			opp-hz = /bits/ 64 <380000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   596  			opp-microvolt = <650000>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   597  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   598  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   599  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   600  		opp-400000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   601  			opp-hz = /bits/ 64 <400000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   602  			opp-microvolt = <656250>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   603  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   604  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   605  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   606  		opp-420000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   607  			opp-hz = /bits/ 64 <420000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   608  			opp-microvolt = <662500>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   609  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   610  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   611  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   612  		opp-460000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   613  			opp-hz = /bits/ 64 <460000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   614  			opp-microvolt = <675000>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   615  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   616  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   617  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   618  		opp-500000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   619  			opp-hz = /bits/ 64 <500000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   620  			opp-microvolt = <687500>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   621  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   622  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   623  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   624  		opp-540000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   625  			opp-hz = /bits/ 64 <540000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   626  			opp-microvolt = <700000>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   627  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   628  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   629  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   630  		opp-580000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   631  			opp-hz = /bits/ 64 <580000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   632  			opp-microvolt = <712500>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   633  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   634  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   635  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   636  		opp-620000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   637  			opp-hz = /bits/ 64 <620000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   638  			opp-microvolt = <725000>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   639  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   640  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   641  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   642  		opp-653000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   643  			opp-hz = /bits/ 64 <653000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   644  			opp-microvolt = <743750>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   645  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   646  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   647  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   648  		opp-698000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   649  			opp-hz = /bits/ 64 <698000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   650  			opp-microvolt = <768750>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   651  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   652  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   653  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   654  		opp-743000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   655  			opp-hz = /bits/ 64 <743000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   656  			opp-microvolt = <793750>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   657  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   658  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   659  
a8168cebf1bca1 Nicolas Boichat            2021-05-21   660  		opp-800000000 {
a8168cebf1bca1 Nicolas Boichat            2021-05-21   661  			opp-hz = /bits/ 64 <800000000>;
dbe602b27793af AngeloGioacchino Del Regno 2023-03-01   662  			opp-microvolt = <825000>;
c8df13e235ef51 Hsin-Te Yuan               2024-05-27   663  			opp-core-mask = /bits/ 64 <0xf>;
a8168cebf1bca1 Nicolas Boichat            2021-05-21   664  		};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   665  	};
a8168cebf1bca1 Nicolas Boichat            2021-05-21   666  
e526c9bc11f858 Ben Ho                     2019-05-27   667  	pmu-a53 {
e526c9bc11f858 Ben Ho                     2019-05-27   668  		compatible = "arm,cortex-a53-pmu";
e526c9bc11f858 Ben Ho                     2019-05-27   669  		interrupt-parent = <&gic>;
e526c9bc11f858 Ben Ho                     2019-05-27   670  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
e526c9bc11f858 Ben Ho                     2019-05-27   671  	};
e526c9bc11f858 Ben Ho                     2019-05-27   672  
e526c9bc11f858 Ben Ho                     2019-05-27   673  	pmu-a73 {
e526c9bc11f858 Ben Ho                     2019-05-27   674  		compatible = "arm,cortex-a73-pmu";
e526c9bc11f858 Ben Ho                     2019-05-27   675  		interrupt-parent = <&gic>;
e526c9bc11f858 Ben Ho                     2019-05-27   676  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
e526c9bc11f858 Ben Ho                     2019-05-27   677  	};
e526c9bc11f858 Ben Ho                     2019-05-27   678  
e526c9bc11f858 Ben Ho                     2019-05-27   679  	psci {
e526c9bc11f858 Ben Ho                     2019-05-27   680  		compatible = "arm,psci-1.0";
e526c9bc11f858 Ben Ho                     2019-05-27   681  		method = "smc";
e526c9bc11f858 Ben Ho                     2019-05-27   682  	};
e526c9bc11f858 Ben Ho                     2019-05-27   683  
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   684  	clk13m: fixed-factor-clock-13m {
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   685  		compatible = "fixed-factor-clock";
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   686  		#clock-cells = <0>;
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   687  		clocks = <&clk26m>;
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   688  		clock-div = <2>;
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   689  		clock-mult = <1>;
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   690  		clock-output-names = "clk13m";
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   691  	};
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01   692  
e526c9bc11f858 Ben Ho                     2019-05-27   693  	clk26m: oscillator {
e526c9bc11f858 Ben Ho                     2019-05-27   694  		compatible = "fixed-clock";
e526c9bc11f858 Ben Ho                     2019-05-27   695  		#clock-cells = <0>;
e526c9bc11f858 Ben Ho                     2019-05-27   696  		clock-frequency = <26000000>;
e526c9bc11f858 Ben Ho                     2019-05-27   697  		clock-output-names = "clk26m";
e526c9bc11f858 Ben Ho                     2019-05-27   698  	};
e526c9bc11f858 Ben Ho                     2019-05-27   699  
e526c9bc11f858 Ben Ho                     2019-05-27   700  	timer {
e526c9bc11f858 Ben Ho                     2019-05-27   701  		compatible = "arm,armv8-timer";
e526c9bc11f858 Ben Ho                     2019-05-27   702  		interrupt-parent = <&gic>;
e526c9bc11f858 Ben Ho                     2019-05-27   703  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
e526c9bc11f858 Ben Ho                     2019-05-27   704  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
e526c9bc11f858 Ben Ho                     2019-05-27   705  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
e526c9bc11f858 Ben Ho                     2019-05-27   706  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
e526c9bc11f858 Ben Ho                     2019-05-27   707  	};
e526c9bc11f858 Ben Ho                     2019-05-27   708  
e526c9bc11f858 Ben Ho                     2019-05-27   709  	soc {
e526c9bc11f858 Ben Ho                     2019-05-27   710  		#address-cells = <2>;
e526c9bc11f858 Ben Ho                     2019-05-27   711  		#size-cells = <2>;
e526c9bc11f858 Ben Ho                     2019-05-27   712  		compatible = "simple-bus";
e526c9bc11f858 Ben Ho                     2019-05-27   713  		ranges;
e526c9bc11f858 Ben Ho                     2019-05-27   714  
2208b284bee05d Chunfeng Yun               2022-06-17   715  		soc_data: efuse@8000000 {
de1033881e9363 Michael Mei                2019-05-27   716  			compatible = "mediatek,mt8183-efuse",
de1033881e9363 Michael Mei                2019-05-27   717  				     "mediatek,efuse";
de1033881e9363 Michael Mei                2019-05-27   718  			reg = <0 0x08000000 0 0x0010>;
de1033881e9363 Michael Mei                2019-05-27   719  			#address-cells = <1>;
de1033881e9363 Michael Mei                2019-05-27   720  			#size-cells = <1>;
de1033881e9363 Michael Mei                2019-05-27   721  			status = "disabled";
de1033881e9363 Michael Mei                2019-05-27   722  		};
de1033881e9363 Michael Mei                2019-05-27   723  
e526c9bc11f858 Ben Ho                     2019-05-27   724  		gic: interrupt-controller@c000000 {
e526c9bc11f858 Ben Ho                     2019-05-27   725  			compatible = "arm,gic-v3";
e526c9bc11f858 Ben Ho                     2019-05-27   726  			#interrupt-cells = <4>;
e526c9bc11f858 Ben Ho                     2019-05-27   727  			interrupt-parent = <&gic>;
e526c9bc11f858 Ben Ho                     2019-05-27   728  			interrupt-controller;
e526c9bc11f858 Ben Ho                     2019-05-27   729  			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
e526c9bc11f858 Ben Ho                     2019-05-27   730  			      <0 0x0c100000 0 0x200000>, /* GICR */
e526c9bc11f858 Ben Ho                     2019-05-27   731  			      <0 0x0c400000 0 0x2000>,   /* GICC */
e526c9bc11f858 Ben Ho                     2019-05-27   732  			      <0 0x0c410000 0 0x1000>,   /* GICH */
e526c9bc11f858 Ben Ho                     2019-05-27   733  			      <0 0x0c420000 0 0x2000>;   /* GICV */
e526c9bc11f858 Ben Ho                     2019-05-27   734  
e526c9bc11f858 Ben Ho                     2019-05-27   735  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
e526c9bc11f858 Ben Ho                     2019-05-27   736  			ppi-partitions {
e526c9bc11f858 Ben Ho                     2019-05-27   737  				ppi_cluster0: interrupt-partition-0 {
e526c9bc11f858 Ben Ho                     2019-05-27   738  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
e526c9bc11f858 Ben Ho                     2019-05-27   739  				};
e526c9bc11f858 Ben Ho                     2019-05-27   740  				ppi_cluster1: interrupt-partition-1 {
e526c9bc11f858 Ben Ho                     2019-05-27   741  					affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
e526c9bc11f858 Ben Ho                     2019-05-27   742  				};
e526c9bc11f858 Ben Ho                     2019-05-27   743  			};
e526c9bc11f858 Ben Ho                     2019-05-27   744  		};
e526c9bc11f858 Ben Ho                     2019-05-27   745  
e526c9bc11f858 Ben Ho                     2019-05-27   746  		mcucfg: syscon@c530000 {
e526c9bc11f858 Ben Ho                     2019-05-27   747  			compatible = "mediatek,mt8183-mcucfg", "syscon";
e526c9bc11f858 Ben Ho                     2019-05-27   748  			reg = <0 0x0c530000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27   749  			#clock-cells = <1>;
e526c9bc11f858 Ben Ho                     2019-05-27   750  		};
e526c9bc11f858 Ben Ho                     2019-05-27   751  
e526c9bc11f858 Ben Ho                     2019-05-27   752  		sysirq: interrupt-controller@c530a80 {
e526c9bc11f858 Ben Ho                     2019-05-27   753  			compatible = "mediatek,mt8183-sysirq",
e526c9bc11f858 Ben Ho                     2019-05-27   754  				     "mediatek,mt6577-sysirq";
e526c9bc11f858 Ben Ho                     2019-05-27   755  			interrupt-controller;
e526c9bc11f858 Ben Ho                     2019-05-27   756  			#interrupt-cells = <3>;
e526c9bc11f858 Ben Ho                     2019-05-27   757  			interrupt-parent = <&gic>;
e526c9bc11f858 Ben Ho                     2019-05-27   758  			reg = <0 0x0c530a80 0 0x50>;
e526c9bc11f858 Ben Ho                     2019-05-27   759  		};
e526c9bc11f858 Ben Ho                     2019-05-27   760  
7781083fd609f8 Seiya Wang                 2021-11-02   761  		cpu_debug0: cpu-debug@d410000 {
7781083fd609f8 Seiya Wang                 2021-11-02   762  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   763  			reg = <0x0 0xd410000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   764  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   765  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   766  			cpu = <&cpu0>;
7781083fd609f8 Seiya Wang                 2021-11-02   767  		};
7781083fd609f8 Seiya Wang                 2021-11-02   768  
7781083fd609f8 Seiya Wang                 2021-11-02   769  		cpu_debug1: cpu-debug@d510000 {
7781083fd609f8 Seiya Wang                 2021-11-02   770  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   771  			reg = <0x0 0xd510000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   772  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   773  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   774  			cpu = <&cpu1>;
7781083fd609f8 Seiya Wang                 2021-11-02   775  		};
7781083fd609f8 Seiya Wang                 2021-11-02   776  
7781083fd609f8 Seiya Wang                 2021-11-02   777  		cpu_debug2: cpu-debug@d610000 {
7781083fd609f8 Seiya Wang                 2021-11-02   778  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   779  			reg = <0x0 0xd610000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   780  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   781  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   782  			cpu = <&cpu2>;
7781083fd609f8 Seiya Wang                 2021-11-02   783  		};
7781083fd609f8 Seiya Wang                 2021-11-02   784  
7781083fd609f8 Seiya Wang                 2021-11-02   785  		cpu_debug3: cpu-debug@d710000 {
7781083fd609f8 Seiya Wang                 2021-11-02   786  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   787  			reg = <0x0 0xd710000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   788  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   789  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   790  			cpu = <&cpu3>;
7781083fd609f8 Seiya Wang                 2021-11-02   791  		};
7781083fd609f8 Seiya Wang                 2021-11-02   792  
7781083fd609f8 Seiya Wang                 2021-11-02   793  		cpu_debug4: cpu-debug@d810000 {
7781083fd609f8 Seiya Wang                 2021-11-02   794  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   795  			reg = <0x0 0xd810000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   796  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   797  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   798  			cpu = <&cpu4>;
7781083fd609f8 Seiya Wang                 2021-11-02   799  		};
7781083fd609f8 Seiya Wang                 2021-11-02   800  
7781083fd609f8 Seiya Wang                 2021-11-02   801  		cpu_debug5: cpu-debug@d910000 {
7781083fd609f8 Seiya Wang                 2021-11-02   802  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   803  			reg = <0x0 0xd910000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   804  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   805  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   806  			cpu = <&cpu5>;
7781083fd609f8 Seiya Wang                 2021-11-02   807  		};
7781083fd609f8 Seiya Wang                 2021-11-02   808  
7781083fd609f8 Seiya Wang                 2021-11-02   809  		cpu_debug6: cpu-debug@da10000 {
7781083fd609f8 Seiya Wang                 2021-11-02   810  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   811  			reg = <0x0 0xda10000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   812  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   813  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   814  			cpu = <&cpu6>;
7781083fd609f8 Seiya Wang                 2021-11-02   815  		};
7781083fd609f8 Seiya Wang                 2021-11-02   816  
7781083fd609f8 Seiya Wang                 2021-11-02   817  		cpu_debug7: cpu-debug@db10000 {
7781083fd609f8 Seiya Wang                 2021-11-02   818  			compatible = "arm,coresight-cpu-debug", "arm,primecell";
7781083fd609f8 Seiya Wang                 2021-11-02   819  			reg = <0x0 0xdb10000 0x0 0x1000>;
7781083fd609f8 Seiya Wang                 2021-11-02   820  			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
7781083fd609f8 Seiya Wang                 2021-11-02   821  			clock-names = "apb_pclk";
7781083fd609f8 Seiya Wang                 2021-11-02   822  			cpu = <&cpu7>;
7781083fd609f8 Seiya Wang                 2021-11-02   823  		};
7781083fd609f8 Seiya Wang                 2021-11-02   824  
e526c9bc11f858 Ben Ho                     2019-05-27   825  		topckgen: syscon@10000000 {
e526c9bc11f858 Ben Ho                     2019-05-27   826  			compatible = "mediatek,mt8183-topckgen", "syscon";
e526c9bc11f858 Ben Ho                     2019-05-27   827  			reg = <0 0x10000000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27   828  			#clock-cells = <1>;
e526c9bc11f858 Ben Ho                     2019-05-27   829  		};
e526c9bc11f858 Ben Ho                     2019-05-27   830  
e526c9bc11f858 Ben Ho                     2019-05-27   831  		infracfg: syscon@10001000 {
e526c9bc11f858 Ben Ho                     2019-05-27   832  			compatible = "mediatek,mt8183-infracfg", "syscon";
e526c9bc11f858 Ben Ho                     2019-05-27   833  			reg = <0 0x10001000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27   834  			#clock-cells = <1>;
a845ad16212e32 yong.liang                 2019-12-26   835  			#reset-cells = <1>;
e526c9bc11f858 Ben Ho                     2019-05-27   836  		};
e526c9bc11f858 Ben Ho                     2019-05-27   837  
72704ac62334bd Enric Balletbo i Serra     2020-06-25   838  		pericfg: syscon@10003000 {
72704ac62334bd Enric Balletbo i Serra     2020-06-25   839  			compatible = "mediatek,mt8183-pericfg", "syscon";
72704ac62334bd Enric Balletbo i Serra     2020-06-25   840  			reg = <0 0x10003000 0 0x1000>;
72704ac62334bd Enric Balletbo i Serra     2020-06-25   841  			#clock-cells = <1>;
72704ac62334bd Enric Balletbo i Serra     2020-06-25   842  		};
72704ac62334bd Enric Balletbo i Serra     2020-06-25   843  
da719a3567a31a Zhiyong Tao                2019-05-27   844  		pio: pinctrl@10005000 {
da719a3567a31a Zhiyong Tao                2019-05-27   845  			compatible = "mediatek,mt8183-pinctrl";
da719a3567a31a Zhiyong Tao                2019-05-27   846  			reg = <0 0x10005000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   847  			      <0 0x11f20000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   848  			      <0 0x11e80000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   849  			      <0 0x11e70000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   850  			      <0 0x11e90000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   851  			      <0 0x11d30000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   852  			      <0 0x11d20000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   853  			      <0 0x11c50000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   854  			      <0 0x11f30000 0 0x1000>,
da719a3567a31a Zhiyong Tao                2019-05-27   855  			      <0 0x1000b000 0 0x1000>;
da719a3567a31a Zhiyong Tao                2019-05-27   856  			reg-names = "iocfg0", "iocfg1", "iocfg2",
da719a3567a31a Zhiyong Tao                2019-05-27   857  				    "iocfg3", "iocfg4", "iocfg5",
da719a3567a31a Zhiyong Tao                2019-05-27   858  				    "iocfg6", "iocfg7", "iocfg8",
da719a3567a31a Zhiyong Tao                2019-05-27   859  				    "eint";
da719a3567a31a Zhiyong Tao                2019-05-27   860  			gpio-controller;
da719a3567a31a Zhiyong Tao                2019-05-27   861  			#gpio-cells = <2>;
da719a3567a31a Zhiyong Tao                2019-05-27   862  			gpio-ranges = <&pio 0 0 192>;
da719a3567a31a Zhiyong Tao                2019-05-27   863  			interrupt-controller;
da719a3567a31a Zhiyong Tao                2019-05-27   864  			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
da719a3567a31a Zhiyong Tao                2019-05-27   865  			#interrupt-cells = <2>;
da719a3567a31a Zhiyong Tao                2019-05-27   866  		};
da719a3567a31a Zhiyong Tao                2019-05-27   867  
37fb78b9aeb75d Matthias Brugger           2020-10-30   868  		scpsys: syscon@10006000 {
d3dfd468857479 Tinghan Shen               2022-08-11   869  			compatible = "mediatek,mt8183-scpsys", "syscon", "simple-mfd";
37fb78b9aeb75d Matthias Brugger           2020-10-30   870  			reg = <0 0x10006000 0 0x1000>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   871  
37fb78b9aeb75d Matthias Brugger           2020-10-30   872  			/* System Power Manager */
37fb78b9aeb75d Matthias Brugger           2020-10-30   873  			spm: power-controller {
37fb78b9aeb75d Matthias Brugger           2020-10-30   874  				compatible = "mediatek,mt8183-power-controller";
37fb78b9aeb75d Matthias Brugger           2020-10-30   875  				#address-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   876  				#size-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   877  				#power-domain-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   878  
37fb78b9aeb75d Matthias Brugger           2020-10-30   879  				/* power domain of the SoC */
37fb78b9aeb75d Matthias Brugger           2020-10-30   880  				power-domain@MT8183_POWER_DOMAIN_AUDIO {
37fb78b9aeb75d Matthias Brugger           2020-10-30   881  					reg = <MT8183_POWER_DOMAIN_AUDIO>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   882  					clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   883  						 <&infracfg CLK_INFRA_AUDIO>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   884  						 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   885  					clock-names = "audio", "audio1", "audio2";
37fb78b9aeb75d Matthias Brugger           2020-10-30   886  					#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   887  				};
37fb78b9aeb75d Matthias Brugger           2020-10-30   888  
37fb78b9aeb75d Matthias Brugger           2020-10-30   889  				power-domain@MT8183_POWER_DOMAIN_CONN {
37fb78b9aeb75d Matthias Brugger           2020-10-30   890  					reg = <MT8183_POWER_DOMAIN_CONN>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   891  					mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   892  					#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   893  				};
37fb78b9aeb75d Matthias Brugger           2020-10-30   894  
63859d711a13c7 AngeloGioacchino Del Regno 2022-06-23   895  				mfg_async: power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
37fb78b9aeb75d Matthias Brugger           2020-10-30   896  					reg = <MT8183_POWER_DOMAIN_MFG_ASYNC>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   897  					clocks = <&topckgen CLK_TOP_MUX_MFG>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   898  					clock-names = "mfg";
37fb78b9aeb75d Matthias Brugger           2020-10-30   899  					#address-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   900  					#size-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   901  					#power-domain-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   902  
9e1b7d00bbe112 Hsin-Yi Wang               2021-01-29   903  					mfg: power-domain@MT8183_POWER_DOMAIN_MFG {
37fb78b9aeb75d Matthias Brugger           2020-10-30   904  						reg = <MT8183_POWER_DOMAIN_MFG>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   905  						#address-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   906  						#size-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   907  						#power-domain-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   908  
37fb78b9aeb75d Matthias Brugger           2020-10-30   909  						power-domain@MT8183_POWER_DOMAIN_MFG_CORE0 {
37fb78b9aeb75d Matthias Brugger           2020-10-30   910  							reg = <MT8183_POWER_DOMAIN_MFG_CORE0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   911  							#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   912  						};
37fb78b9aeb75d Matthias Brugger           2020-10-30   913  
37fb78b9aeb75d Matthias Brugger           2020-10-30   914  						power-domain@MT8183_POWER_DOMAIN_MFG_CORE1 {
37fb78b9aeb75d Matthias Brugger           2020-10-30   915  							reg = <MT8183_POWER_DOMAIN_MFG_CORE1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   916  							#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   917  						};
37fb78b9aeb75d Matthias Brugger           2020-10-30   918  
37fb78b9aeb75d Matthias Brugger           2020-10-30   919  						power-domain@MT8183_POWER_DOMAIN_MFG_2D {
37fb78b9aeb75d Matthias Brugger           2020-10-30   920  							reg = <MT8183_POWER_DOMAIN_MFG_2D>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   921  							mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   922  							#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   923  						};
37fb78b9aeb75d Matthias Brugger           2020-10-30   924  					};
37fb78b9aeb75d Matthias Brugger           2020-10-30   925  				};
37fb78b9aeb75d Matthias Brugger           2020-10-30   926  
37fb78b9aeb75d Matthias Brugger           2020-10-30   927  				power-domain@MT8183_POWER_DOMAIN_DISP {
37fb78b9aeb75d Matthias Brugger           2020-10-30   928  					reg = <MT8183_POWER_DOMAIN_DISP>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   929  					clocks = <&topckgen CLK_TOP_MUX_MM>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   930  						 <&mmsys CLK_MM_SMI_COMMON>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   931  						 <&mmsys CLK_MM_SMI_LARB0>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   932  						 <&mmsys CLK_MM_SMI_LARB1>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   933  						 <&mmsys CLK_MM_GALS_COMM0>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   934  						 <&mmsys CLK_MM_GALS_COMM1>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   935  						 <&mmsys CLK_MM_GALS_CCU2MM>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   936  						 <&mmsys CLK_MM_GALS_IPU12MM>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   937  						 <&mmsys CLK_MM_GALS_IMG2MM>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   938  						 <&mmsys CLK_MM_GALS_CAM2MM>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   939  						 <&mmsys CLK_MM_GALS_IPU2MM>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   940  					clock-names = "mm", "mm-0", "mm-1", "mm-2", "mm-3",
37fb78b9aeb75d Matthias Brugger           2020-10-30   941  						      "mm-4", "mm-5", "mm-6", "mm-7",
37fb78b9aeb75d Matthias Brugger           2020-10-30   942  						      "mm-8", "mm-9";
37fb78b9aeb75d Matthias Brugger           2020-10-30   943  					mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   944  					mediatek,smi = <&smi_common>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   945  					#address-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   946  					#size-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   947  					#power-domain-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   948  
37fb78b9aeb75d Matthias Brugger           2020-10-30   949  					power-domain@MT8183_POWER_DOMAIN_CAM {
37fb78b9aeb75d Matthias Brugger           2020-10-30   950  						reg = <MT8183_POWER_DOMAIN_CAM>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   951  						clocks = <&topckgen CLK_TOP_MUX_CAM>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   952  							 <&camsys CLK_CAM_LARB6>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   953  							 <&camsys CLK_CAM_LARB3>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   954  							 <&camsys CLK_CAM_SENINF>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   955  							 <&camsys CLK_CAM_CAMSV0>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   956  							 <&camsys CLK_CAM_CAMSV1>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   957  							 <&camsys CLK_CAM_CAMSV2>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   958  							 <&camsys CLK_CAM_CCU>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   959  						clock-names = "cam", "cam-0", "cam-1",
37fb78b9aeb75d Matthias Brugger           2020-10-30   960  							      "cam-2", "cam-3", "cam-4",
37fb78b9aeb75d Matthias Brugger           2020-10-30   961  							      "cam-5", "cam-6";
37fb78b9aeb75d Matthias Brugger           2020-10-30   962  						mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   963  						mediatek,smi = <&smi_common>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   964  						#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   965  					};
37fb78b9aeb75d Matthias Brugger           2020-10-30   966  
37fb78b9aeb75d Matthias Brugger           2020-10-30   967  					power-domain@MT8183_POWER_DOMAIN_ISP {
37fb78b9aeb75d Matthias Brugger           2020-10-30   968  						reg = <MT8183_POWER_DOMAIN_ISP>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   969  						clocks = <&topckgen CLK_TOP_MUX_IMG>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   970  							 <&imgsys CLK_IMG_LARB5>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   971  							 <&imgsys CLK_IMG_LARB2>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   972  						clock-names = "isp", "isp-0", "isp-1";
37fb78b9aeb75d Matthias Brugger           2020-10-30   973  						mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   974  						mediatek,smi = <&smi_common>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   975  						#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   976  					};
37fb78b9aeb75d Matthias Brugger           2020-10-30   977  
37fb78b9aeb75d Matthias Brugger           2020-10-30   978  					power-domain@MT8183_POWER_DOMAIN_VDEC {
37fb78b9aeb75d Matthias Brugger           2020-10-30   979  						reg = <MT8183_POWER_DOMAIN_VDEC>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   980  						mediatek,smi = <&smi_common>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   981  						#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   982  					};
37fb78b9aeb75d Matthias Brugger           2020-10-30   983  
37fb78b9aeb75d Matthias Brugger           2020-10-30   984  					power-domain@MT8183_POWER_DOMAIN_VENC {
37fb78b9aeb75d Matthias Brugger           2020-10-30   985  						reg = <MT8183_POWER_DOMAIN_VENC>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   986  						mediatek,smi = <&smi_common>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   987  						#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   988  					};
37fb78b9aeb75d Matthias Brugger           2020-10-30   989  
37fb78b9aeb75d Matthias Brugger           2020-10-30   990  					power-domain@MT8183_POWER_DOMAIN_VPU_TOP {
37fb78b9aeb75d Matthias Brugger           2020-10-30   991  						reg = <MT8183_POWER_DOMAIN_VPU_TOP>;
37fb78b9aeb75d Matthias Brugger           2020-10-30   992  						clocks = <&topckgen CLK_TOP_MUX_IPU_IF>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   993  							 <&topckgen CLK_TOP_MUX_DSP>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   994  							 <&ipu_conn CLK_IPU_CONN_IPU>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   995  							 <&ipu_conn CLK_IPU_CONN_AHB>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   996  							 <&ipu_conn CLK_IPU_CONN_AXI>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   997  							 <&ipu_conn CLK_IPU_CONN_ISP>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   998  							 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
37fb78b9aeb75d Matthias Brugger           2020-10-30   999  							 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1000  						clock-names = "vpu", "vpu1", "vpu-0", "vpu-1",
37fb78b9aeb75d Matthias Brugger           2020-10-30  1001  							      "vpu-2", "vpu-3", "vpu-4", "vpu-5";
37fb78b9aeb75d Matthias Brugger           2020-10-30  1002  						mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1003  						mediatek,smi = <&smi_common>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1004  						#address-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1005  						#size-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1006  						#power-domain-cells = <1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1007  
37fb78b9aeb75d Matthias Brugger           2020-10-30  1008  						power-domain@MT8183_POWER_DOMAIN_VPU_CORE0 {
37fb78b9aeb75d Matthias Brugger           2020-10-30  1009  							reg = <MT8183_POWER_DOMAIN_VPU_CORE0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1010  							clocks = <&topckgen CLK_TOP_MUX_DSP1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1011  							clock-names = "vpu2";
37fb78b9aeb75d Matthias Brugger           2020-10-30  1012  							mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1013  							#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1014  						};
37fb78b9aeb75d Matthias Brugger           2020-10-30  1015  
37fb78b9aeb75d Matthias Brugger           2020-10-30  1016  						power-domain@MT8183_POWER_DOMAIN_VPU_CORE1 {
37fb78b9aeb75d Matthias Brugger           2020-10-30  1017  							reg = <MT8183_POWER_DOMAIN_VPU_CORE1>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1018  							clocks = <&topckgen CLK_TOP_MUX_DSP2>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1019  							clock-names = "vpu3";
37fb78b9aeb75d Matthias Brugger           2020-10-30  1020  							mediatek,infracfg = <&infracfg>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1021  							#power-domain-cells = <0>;
37fb78b9aeb75d Matthias Brugger           2020-10-30  1022  						};
37fb78b9aeb75d Matthias Brugger           2020-10-30  1023  					};
37fb78b9aeb75d Matthias Brugger           2020-10-30  1024  				};
37fb78b9aeb75d Matthias Brugger           2020-10-30  1025  			};
37fb78b9aeb75d Matthias Brugger           2020-10-30  1026  		};
37fb78b9aeb75d Matthias Brugger           2020-10-30  1027  
a39f842541038e yong.liang                 2020-02-17  1028  		watchdog: watchdog@10007000 {
f866c471542e6d Crystal Guo                2020-08-03  1029  			compatible = "mediatek,mt8183-wdt";
a39f842541038e yong.liang                 2020-02-17  1030  			reg = <0 0x10007000 0 0x100>;
a39f842541038e yong.liang                 2020-02-17  1031  			#reset-cells = <1>;
a39f842541038e yong.liang                 2020-02-17  1032  		};
a39f842541038e yong.liang                 2020-02-17  1033  
e526c9bc11f858 Ben Ho                     2019-05-27  1034  		apmixedsys: syscon@1000c000 {
e526c9bc11f858 Ben Ho                     2019-05-27  1035  			compatible = "mediatek,mt8183-apmixedsys", "syscon";
e526c9bc11f858 Ben Ho                     2019-05-27  1036  			reg = <0 0x1000c000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27  1037  			#clock-cells = <1>;
e526c9bc11f858 Ben Ho                     2019-05-27  1038  		};
e526c9bc11f858 Ben Ho                     2019-05-27  1039  
e526c9bc11f858 Ben Ho                     2019-05-27  1040  		pwrap: pwrap@1000d000 {
e526c9bc11f858 Ben Ho                     2019-05-27  1041  			compatible = "mediatek,mt8183-pwrap";
e526c9bc11f858 Ben Ho                     2019-05-27  1042  			reg = <0 0x1000d000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27  1043  			reg-names = "pwrap";
cac33c104a1007 Hsin-Hsiung Wang           2019-08-22  1044  			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
e526c9bc11f858 Ben Ho                     2019-05-27  1045  			clocks = <&topckgen CLK_TOP_MUX_PMICSPI>,
e526c9bc11f858 Ben Ho                     2019-05-27  1046  				 <&infracfg CLK_INFRA_PMIC_AP>;
e526c9bc11f858 Ben Ho                     2019-05-27  1047  			clock-names = "spi", "wrap";
e526c9bc11f858 Ben Ho                     2019-05-27  1048  		};
e526c9bc11f858 Ben Ho                     2019-05-27  1049  
a8013418d35cc7 Fabien Parent              2022-07-26  1050  		keyboard: keyboard@10010000 {
a8013418d35cc7 Fabien Parent              2022-07-26  1051  			compatible = "mediatek,mt6779-keypad";
a8013418d35cc7 Fabien Parent              2022-07-26  1052  			reg = <0 0x10010000 0 0x1000>;
a8013418d35cc7 Fabien Parent              2022-07-26  1053  			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_FALLING>;
a8013418d35cc7 Fabien Parent              2022-07-26  1054  			clocks = <&clk26m>;
a8013418d35cc7 Fabien Parent              2022-07-26  1055  			clock-names = "kpd";
a8013418d35cc7 Fabien Parent              2022-07-26  1056  			status = "disabled";
a8013418d35cc7 Fabien Parent              2022-07-26  1057  		};
a8013418d35cc7 Fabien Parent              2022-07-26  1058  
1652dbf7363a6c Eddie Huang                2019-11-12  1059  		scp: scp@10500000 {
1652dbf7363a6c Eddie Huang                2019-11-12  1060  			compatible = "mediatek,mt8183-scp";
1652dbf7363a6c Eddie Huang                2019-11-12  1061  			reg = <0 0x10500000 0 0x80000>,
1652dbf7363a6c Eddie Huang                2019-11-12  1062  			      <0 0x105c0000 0 0x19080>;
1652dbf7363a6c Eddie Huang                2019-11-12  1063  			reg-names = "sram", "cfg";
1652dbf7363a6c Eddie Huang                2019-11-12  1064  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
1652dbf7363a6c Eddie Huang                2019-11-12  1065  			clocks = <&infracfg CLK_INFRA_SCPSYS>;
1652dbf7363a6c Eddie Huang                2019-11-12  1066  			clock-names = "main";
1652dbf7363a6c Eddie Huang                2019-11-12  1067  			memory-region = <&scp_mem_reserved>;
1652dbf7363a6c Eddie Huang                2019-11-12  1068  			status = "disabled";
1652dbf7363a6c Eddie Huang                2019-11-12  1069  		};
1652dbf7363a6c Eddie Huang                2019-11-12  1070  
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1071  		systimer: timer@10017000 {
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1072  			compatible = "mediatek,mt8183-timer",
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1073  				     "mediatek,mt6765-timer";
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1074  			reg = <0 0x10017000 0 0x1000>;
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1075  			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
ce8a06b5bac75c Chen-Yu Tsai               2022-12-01  1076  			clocks = <&clk13m>;
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1077  		};
5bc8e2875ffbc5 Dehui Sun                  2019-10-28  1078  
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1079  		iommu: iommu@10205000 {
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1080  			compatible = "mediatek,mt8183-m4u";
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1081  			reg = <0 0x10205000 0 0x1000>;
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1082  			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
33c7874b44324f Nícolas F. R. A. Prado     2022-03-01  1083  			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>,
33c7874b44324f Nícolas F. R. A. Prado     2022-03-01  1084  					 <&larb4>, <&larb5>, <&larb6>;
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1085  			#iommu-cells = <1>;
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1086  		};
c6080916310b6d Enric Balletbo i Serra     2020-11-27  1087  
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1088  		gce: mailbox@10238000 {
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1089  			compatible = "mediatek,mt8183-gce";
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1090  			reg = <0 0x10238000 0 0x4000>;
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1091  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
e55c56df43dd11 Fabien Parent              2020-10-18  1092  			#mbox-cells = <2>;
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1093  			clocks = <&infracfg CLK_INFRA_GCE>;
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1094  			clock-names = "gce";
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1095  		};
d3c306e31bc7a2 Bibby Hsieh                2019-11-21  1096  
eb59b35331469f Zhiyong Tao                2019-05-27  1097  		auxadc: auxadc@11001000 {
eb59b35331469f Zhiyong Tao                2019-05-27  1098  			compatible = "mediatek,mt8183-auxadc",
eb59b35331469f Zhiyong Tao                2019-05-27  1099  				     "mediatek,mt8173-auxadc";
eb59b35331469f Zhiyong Tao                2019-05-27  1100  			reg = <0 0x11001000 0 0x1000>;
eb59b35331469f Zhiyong Tao                2019-05-27  1101  			clocks = <&infracfg CLK_INFRA_AUXADC>;
eb59b35331469f Zhiyong Tao                2019-05-27  1102  			clock-names = "main";
eb59b35331469f Zhiyong Tao                2019-05-27  1103  			#io-channel-cells = <1>;
eb59b35331469f Zhiyong Tao                2019-05-27  1104  			status = "disabled";
eb59b35331469f Zhiyong Tao                2019-05-27  1105  		};
eb59b35331469f Zhiyong Tao                2019-05-27  1106  
e526c9bc11f858 Ben Ho                     2019-05-27  1107  		uart0: serial@11002000 {
e526c9bc11f858 Ben Ho                     2019-05-27  1108  			compatible = "mediatek,mt8183-uart",
e526c9bc11f858 Ben Ho                     2019-05-27  1109  				     "mediatek,mt6577-uart";
e526c9bc11f858 Ben Ho                     2019-05-27  1110  			reg = <0 0x11002000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27  1111  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
e526c9bc11f858 Ben Ho                     2019-05-27  1112  			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
e526c9bc11f858 Ben Ho                     2019-05-27  1113  			clock-names = "baud", "bus";
e526c9bc11f858 Ben Ho                     2019-05-27  1114  			status = "disabled";
e526c9bc11f858 Ben Ho                     2019-05-27  1115  		};
e526c9bc11f858 Ben Ho                     2019-05-27  1116  
e526c9bc11f858 Ben Ho                     2019-05-27  1117  		uart1: serial@11003000 {
e526c9bc11f858 Ben Ho                     2019-05-27  1118  			compatible = "mediatek,mt8183-uart",
e526c9bc11f858 Ben Ho                     2019-05-27  1119  				     "mediatek,mt6577-uart";
e526c9bc11f858 Ben Ho                     2019-05-27  1120  			reg = <0 0x11003000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27  1121  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
e526c9bc11f858 Ben Ho                     2019-05-27  1122  			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
e526c9bc11f858 Ben Ho                     2019-05-27  1123  			clock-names = "baud", "bus";
e526c9bc11f858 Ben Ho                     2019-05-27  1124  			status = "disabled";
e526c9bc11f858 Ben Ho                     2019-05-27  1125  		};
e526c9bc11f858 Ben Ho                     2019-05-27  1126  
e526c9bc11f858 Ben Ho                     2019-05-27  1127  		uart2: serial@11004000 {
e526c9bc11f858 Ben Ho                     2019-05-27  1128  			compatible = "mediatek,mt8183-uart",
e526c9bc11f858 Ben Ho                     2019-05-27  1129  				     "mediatek,mt6577-uart";
e526c9bc11f858 Ben Ho                     2019-05-27  1130  			reg = <0 0x11004000 0 0x1000>;
e526c9bc11f858 Ben Ho                     2019-05-27  1131  			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
e526c9bc11f858 Ben Ho                     2019-05-27  1132  			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART2>;
e526c9bc11f858 Ben Ho                     2019-05-27  1133  			clock-names = "baud", "bus";
e526c9bc11f858 Ben Ho                     2019-05-27  1134  			status = "disabled";
e526c9bc11f858 Ben Ho                     2019-05-27  1135  		};
e526c9bc11f858 Ben Ho                     2019-05-27  1136  
251137b8fa97ef Qii Wang                   2019-08-22  1137  		i2c6: i2c@11005000 {
251137b8fa97ef Qii Wang                   2019-08-22  1138  			compatible = "mediatek,mt8183-i2c";
251137b8fa97ef Qii Wang                   2019-08-22  1139  			reg = <0 0x11005000 0 0x1000>,
251137b8fa97ef Qii Wang                   2019-08-22  1140  			      <0 0x11000600 0 0x80>;
251137b8fa97ef Qii Wang                   2019-08-22  1141  			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
251137b8fa97ef Qii Wang                   2019-08-22  1142  			clocks = <&infracfg CLK_INFRA_I2C6>,
251137b8fa97ef Qii Wang                   2019-08-22  1143  				 <&infracfg CLK_INFRA_AP_DMA>;
251137b8fa97ef Qii Wang                   2019-08-22  1144  			clock-names = "main", "dma";
251137b8fa97ef Qii Wang                   2019-08-22  1145  			clock-div = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1146  			#address-cells = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1147  			#size-cells = <0>;
251137b8fa97ef Qii Wang                   2019-08-22  1148  			status = "disabled";
251137b8fa97ef Qii Wang                   2019-08-22  1149  		};
251137b8fa97ef Qii Wang                   2019-08-22  1150  
251137b8fa97ef Qii Wang                   2019-08-22  1151  		i2c0: i2c@11007000 {
251137b8fa97ef Qii Wang                   2019-08-22  1152  			compatible = "mediatek,mt8183-i2c";
251137b8fa97ef Qii Wang                   2019-08-22  1153  			reg = <0 0x11007000 0 0x1000>,
251137b8fa97ef Qii Wang                   2019-08-22  1154  			      <0 0x11000080 0 0x80>;
251137b8fa97ef Qii Wang                   2019-08-22  1155  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
251137b8fa97ef Qii Wang                   2019-08-22  1156  			clocks = <&infracfg CLK_INFRA_I2C0>,
251137b8fa97ef Qii Wang                   2019-08-22  1157  				 <&infracfg CLK_INFRA_AP_DMA>;
251137b8fa97ef Qii Wang                   2019-08-22  1158  			clock-names = "main", "dma";
251137b8fa97ef Qii Wang                   2019-08-22  1159  			clock-div = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1160  			#address-cells = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1161  			#size-cells = <0>;
251137b8fa97ef Qii Wang                   2019-08-22  1162  			status = "disabled";
251137b8fa97ef Qii Wang                   2019-08-22  1163  		};
251137b8fa97ef Qii Wang                   2019-08-22  1164  
251137b8fa97ef Qii Wang                   2019-08-22  1165  		i2c4: i2c@11008000 {
251137b8fa97ef Qii Wang                   2019-08-22  1166  			compatible = "mediatek,mt8183-i2c";
251137b8fa97ef Qii Wang                   2019-08-22  1167  			reg = <0 0x11008000 0 0x1000>,
251137b8fa97ef Qii Wang                   2019-08-22  1168  			      <0 0x11000100 0 0x80>;
251137b8fa97ef Qii Wang                   2019-08-22  1169  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>;
251137b8fa97ef Qii Wang                   2019-08-22  1170  			clocks = <&infracfg CLK_INFRA_I2C1>,
251137b8fa97ef Qii Wang                   2019-08-22  1171  				 <&infracfg CLK_INFRA_AP_DMA>,
251137b8fa97ef Qii Wang                   2019-08-22  1172  				 <&infracfg CLK_INFRA_I2C1_ARBITER>;
251137b8fa97ef Qii Wang                   2019-08-22  1173  			clock-names = "main", "dma","arb";
251137b8fa97ef Qii Wang                   2019-08-22  1174  			clock-div = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1175  			#address-cells = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1176  			#size-cells = <0>;
251137b8fa97ef Qii Wang                   2019-08-22  1177  			status = "disabled";
251137b8fa97ef Qii Wang                   2019-08-22  1178  		};
251137b8fa97ef Qii Wang                   2019-08-22  1179  
251137b8fa97ef Qii Wang                   2019-08-22  1180  		i2c2: i2c@11009000 {
251137b8fa97ef Qii Wang                   2019-08-22  1181  			compatible = "mediatek,mt8183-i2c";
251137b8fa97ef Qii Wang                   2019-08-22  1182  			reg = <0 0x11009000 0 0x1000>,
251137b8fa97ef Qii Wang                   2019-08-22  1183  			      <0 0x11000280 0 0x80>;
251137b8fa97ef Qii Wang                   2019-08-22  1184  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
251137b8fa97ef Qii Wang                   2019-08-22  1185  			clocks = <&infracfg CLK_INFRA_I2C2>,
251137b8fa97ef Qii Wang                   2019-08-22  1186  				 <&infracfg CLK_INFRA_AP_DMA>,
251137b8fa97ef Qii Wang                   2019-08-22  1187  				 <&infracfg CLK_INFRA_I2C2_ARBITER>;
251137b8fa97ef Qii Wang                   2019-08-22  1188  			clock-names = "main", "dma", "arb";
251137b8fa97ef Qii Wang                   2019-08-22  1189  			clock-div = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1190  			#address-cells = <1>;
251137b8fa97ef Qii Wang                   2019-08-22  1191  			#size-cells = <0>;
251137b8fa97ef Qii Wang                   2019-08-22  1192  			status = "disabled";
251137b8fa97ef Qii Wang                   2019-08-22  1193  		};
251137b8fa97ef Qii Wang                   2019-08-22  1194  
8e2dd0f9249119 Erin Lo                    2019-05-27  1195  		spi0: spi@1100a000 {
8e2dd0f9249119 Erin Lo                    2019-05-27  1196  			compatible = "mediatek,mt8183-spi";
8e2dd0f9249119 Erin Lo                    2019-05-27  1197  			#address-cells = <1>;
8e2dd0f9249119 Erin Lo                    2019-05-27  1198  			#size-cells = <0>;
8e2dd0f9249119 Erin Lo                    2019-05-27  1199  			reg = <0 0x1100a000 0 0x1000>;
8e2dd0f9249119 Erin Lo                    2019-05-27  1200  			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_LOW>;
8e2dd0f9249119 Erin Lo                    2019-05-27  1201  			clocks = <&topckgen CLK_TOP_SYSPLL_D5_D2>,
8e2dd0f9249119 Erin Lo                    2019-05-27  1202  				 <&topckgen CLK_TOP_MUX_SPI>,
8e2dd0f9249119 Erin Lo                    2019-05-27  1203  				 <&infracfg CLK_INFRA_SPI0>;
8e2dd0f9249119 Erin Lo                    2019-05-27  1204  			clock-names = "parent-clk", "sel-clk", "spi-clk";
8e2dd0f9249119 Erin Lo                    2019-05-27  1205  			status = "disabled";
8e2dd0f9249119 Erin Lo                    2019-05-27  1206  		};
8e2dd0f9249119 Erin Lo                    2019-05-27  1207  
41131266c8ce50 Roger Lu                   2022-05-16 @1208  		svs: svs@1100b000 {

:::::: The code at line 1208 was first introduced by commit
:::::: 41131266c8ce50eaf767a818a4a763bd3eb2a75b arm64: dts: mt8183: add svs device information

:::::: TO: Roger Lu <roger.lu@mediatek.com>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
