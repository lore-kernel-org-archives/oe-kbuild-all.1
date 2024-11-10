Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9C14B080
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731271787; cv=none; b=XOPk1nRv9C5xC8f8mI1PJ/Q23qifv9sBhXEeAqYE3kZIckRQ3B4dleqSrrx3sQSdo5ZVhl4xIw9v+d0EDCA0x0fBoXAiESDx+Ngop8n8GiBlv6+5HELWIzUU1Byaro/Msle+ZzYjeyyEADNYzBpp1N9GHgkNX5890S/uBGT93S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731271787; c=relaxed/simple;
	bh=cjiHVEPj94n+29xPATa9ZhYL1lTTIjoDVOIz2Z4NRHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6rdrlTb1xImMMST+WI4oKAdoHoPWiFWBPC65HmY0UcofX78fOFJz7XR1wDXNSITV3agYxY4skqcuxwVyCYYFxg5l+LQOSvuWWzPpPekG7OV3NV40HwBYszLv/SVvj24/ql4VUJDso/eNYqY2wuOJZR4eWi4ZOeD81LiiWVzM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5CfsIPY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5CfsIPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731271785; x=1762807785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjiHVEPj94n+29xPATa9ZhYL1lTTIjoDVOIz2Z4NRHo=;
  b=P5CfsIPYCOOqLOk2q9mW/NQBf0Zn/gfOYjlHWgc7c25ZhW/65reOqdPc
   6Bai8Zb2WSdcOzrf3wKviMKB8OsHvrSSZkSD1Yiuf6+sKyK3XpRyuYDBg
   Nro2DsSW9pK0tGQfvpR3AbtnLQhGw4FBOO3kL6roOMFcutflelTbWs7Pi
   Xz6fRHFH0frvc8HAuwtaqz+t41xQyl/acs1lry9V3j3iOp4Et3G0n+uwl
   R5rEPvQxOodDypOZ0ZEGvJmwnING4Fvoo0X0PPQ4ayfqUg2quh7bIsgub
   b+rBedAjg4QpZa/Zab6lS/q3ljCxfQnIGCkeSe2VsnuA57FcN68Q2Vx19
   A==;
X-CSE-ConnectionGUID: y6e5K2IRRWuHf1ilB2cbsQ==
X-CSE-MsgGUID: jk9FIgSYQY+9OG+lmei6Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31245516"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31245516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 12:49:45 -0800
X-CSE-ConnectionGUID: 6+HX6Q9/T/yhjbzWGhdrmQ==
X-CSE-MsgGUID: jLoOL0exTd6nZ3AQPmmcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="109871700"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Nov 2024 12:49:43 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAEsP-0000O5-0t;
	Sun, 10 Nov 2024 20:49:41 +0000
Date: Mon, 11 Nov 2024 04:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: regulators:
 vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
Message-ID: <202411110458.8cnBWt0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   213f014f54af1757a6058da8cb226e8168dc9ec5
commit: 4a0390578cd1530eebdeb92848d84c6627ad87b0 [1/1] CHROMIUM: dts: arm64: mt8186: Edit dts for skitty
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241111/202411110458.8cnBWt0E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411110458.8cnBWt0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411110458.8cnBWt0E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /: failed to match any schema with compatible: ['google,skitty-sku1', 'google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /: failed to match any schema with compatible: ['google,skitty-sku1', 'google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /: failed to match any schema with compatible: ['google,skitty-sku1', 'google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: touchscreen@10: 'hid-descr-addr', 'post-power-on-delay-ms', 'vdd-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/elan,elants_i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: gpu@13040000: clocks: [[120, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: gpu@13040000: sram-supply: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
--
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /: failed to match any schema with compatible: ['google,skitty-sku2', 'google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /: failed to match any schema with compatible: ['google,skitty-sku2', 'google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /: failed to match any schema with compatible: ['google,skitty-sku2', 'google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: gpu@13040000: clocks: [[120, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: gpu@13040000: sram-supply: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
