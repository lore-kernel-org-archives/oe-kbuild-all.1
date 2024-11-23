Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B418C932
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359523; cv=none; b=fcUFo9M2eEb5bQxYsMUc63yJehGgFa58fCjnx36ukWgyTuqSnkLU/yFQhfl8kOJgZu+9jpG8Frl84N7PIOE+zchNiAtJo9wOcYOUZv6/JZglZimm7UKz8qTgA3AF12jBqtTn7WCh2BEamwV2hJjgBe51vdfuKc2rjfELxSWrCeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359523; c=relaxed/simple;
	bh=WoNwip/ryrXyudNlXGM1RpW9lB1OFEBQkmTO4pUU2lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxHsmTp0pKwQwiLFEM0Ps1I88ZUAKA3fYpC497XgPMbt5CCjSXkn8Hx1yWtjddkfMffY4DsWAVUOeNLu5qSvKcM7qbHQQSsGr/GxM/1ZTqstt0uuEYI7rAM0ADNeGmP/PY/gzED/fKrplsf5I3kQWgUEyRfI5MCrfCTk4eq5FGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PomlnGbk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PomlnGbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732359521; x=1763895521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoNwip/ryrXyudNlXGM1RpW9lB1OFEBQkmTO4pUU2lA=;
  b=PomlnGbkAyGJ83CyJTzhea1koe20nsR+5+8lzMWASMNUjxJLjnh0kUWP
   eTws9Er0+L+KMht2wFhbJOXVYGukgBbqrLOLY5F/RtqBmzlYsr7IESeXV
   gUtKFIGtetTWNAq83UWk9VjlbZ2uRsENLqL3CInWP1m+Aift6y73zYCb8
   yT/Pe2u1x6gRzHe3Dlz3NbDNaITwDucfgTe0aQEVMiAwkItu2DREcGewW
   X1yQs/WPUMnXPnos9Ia0YG8HwhtUiRYR/OkVsanx5XRUCDHUbsfz2Kydn
   LOYrn/LHWyLUj+PdAsLE2i6LECKWCuCqT82KDWwyiraJl/YrUAH+LwwQS
   w==;
X-CSE-ConnectionGUID: HSAtWMqGTkaxlQAOFSzCXw==
X-CSE-MsgGUID: I99aC56MRiyfxPX1L/si9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32758194"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="32758194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 02:57:36 -0800
X-CSE-ConnectionGUID: 3B/ucYnYQSOdX1tiWZfARA==
X-CSE-MsgGUID: lQBh6dhVTmyHbK5dYf9wuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90996530"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Nov 2024 02:57:34 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEnpU-0004a3-29;
	Sat, 23 Nov 2024 10:57:32 +0000
Date: Sat, 23 Nov 2024 18:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 249/520]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: regulators:
 vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
Message-ID: <202411231825.zurD51yE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: 6f38851ccef53573330a2e4afebe2b4495fde6e1 [249/520] CHROMIUM: arm64: dts: mediate: Introduce MT8186 Chinchou/Chinchou360 Chromebook
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241123/202411231825.zurD51yE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231825.zurD51yE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231825.zurD51yE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,chinchou-sku5' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: pinctrl@10005000: 'pin-report' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: trackpad@15: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: gpu@13040000: clocks: [[119, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: gpu@13040000: sram-supply: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
--
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /: failed to match any schema with compatible: ['google,chinchou-sku1', 'google,chinchou-sku17', 'google,chinchou-sku3', 'google,chinchou-sku6', 'google,chinchou-sku7', 'google,chinchou-sku20', 'google,chinchou-sku22', 'google,chinchou-sku23', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: pinctrl@10005000: 'pin-report' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: touchscreen@41: 'vcc33-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: gpu@13040000: clocks: [[121, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: gpu@13040000: sram-supply: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
--
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2247.32-2364.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: pinctrl@10005000: 'pin-report' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: touchscreen@41: 'vcc33-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: gpu@13040000: clocks: [[121, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: gpu@13040000: sram-supply: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
