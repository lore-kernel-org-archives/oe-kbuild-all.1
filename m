Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A71DED42
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904557; cv=none; b=sNYqa7lwWFM/eDCfVefE1COUIDTod4S1n8TGeIFwHJdxUaPmDUsXHyUebLYEKc916/ciOhQ/fkMMPRMtp8oUBMaPlLjy0B+zcWbXxygcxqU4lUwCXaRPwxmzeT/boVGgFzmgwnS/S+UIO7+b4PhJ9Byx7mTAaAWSkuolvDTzAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904557; c=relaxed/simple;
	bh=hkMyQ+yD3NGZ0KplUZnfZ28M5XK43Jhm12n1argx0G8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PjEdwBY3GA4TAcTBYXM0m0NQfjywApef9G1B5mIfGlCiq1GDPlHXLs8eDq8phPvuUT8+loGb6wNgfdcyXWdHcZrfyFD1EWOUpPtcd2OlFyfa/q617Af6WtUDxIxmA10cLYRyZrwuHtmpiTrfoFS7S64QN3Xn8ZREJKJ9MX1w/nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeqCWHnq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeqCWHnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772904554; x=1804440554;
  h=date:from:to:cc:subject:message-id;
  bh=hkMyQ+yD3NGZ0KplUZnfZ28M5XK43Jhm12n1argx0G8=;
  b=JeqCWHnqFbfglHGBJ+Z6rXAOQkWwANxp91O3WWl/OJMKxfrqgaXWVspX
   39H5iwlOjISYp81WM1Cg0UpGuAggR1iACwBpRtcYBbcWRNfYYbxh/BUwJ
   bP6p94ZILpqSdpcswHxvJbOR7ghwoOTrOe+aFMOsGB63GMdoDOnO+RKBN
   cH9aBhbF4NOTXoJ6aXwje5gPZkd3YGfaBBJeI9Ag+fhXomg+DjIc1/zc9
   OhDDupLoJcvz157gKu7xdjhWr/xqdELPCYahjD45kvdebkBeepjMJKAAx
   kHw//UeQX9KeqRSHEXkpT5MltmFIABGfxa2IJFbGhKpPRyCypjXwhM6v8
   Q==;
X-CSE-ConnectionGUID: hrFo7wX/TyqonqI4BUwXsw==
X-CSE-MsgGUID: 32QffE0OSPqqODw0gxCB5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74178253"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="74178253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 09:29:13 -0800
X-CSE-ConnectionGUID: cg14qCGpSLSERiGHx5x/EQ==
X-CSE-MsgGUID: Tl4Al+CUQ2iKJjynAB0euQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="215923408"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2026 09:29:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyvSf-000000002Wj-1Vvf;
	Sat, 07 Mar 2026 17:29:09 +0000
Date: Sat, 07 Mar 2026 18:28:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb:
 audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does
 not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603071827.QZMi0bY3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 37020f865aa3c4049266cb34cf83ef299184ae80 [3/3] dt-bindings: arm: mediatek: Support mt8183-audiosys variant
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260307/202603071827.QZMi0bY3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071827.QZMi0bY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071827.QZMi0bY3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: audio-controller@11220000 (mediatek,mt8183-audiosys): 'mt8183-afe-pcm' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
