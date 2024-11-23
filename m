Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10FC1F60A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732373699; cv=none; b=DsasiHkzFaW8dKJArwB2pTpDB7lPbqgZjIzqL8sCU6yzDRSGEPDMIiHFB6UXz4YSihvmXn/IQmwBIWde+E3+affoIEqQH0/uNLDp36lQR4IpYtko5Jsww0b4EJfMqSeizhGgqn8ZhLBLlRDxdXRW8rRh01tu4PCYqD1w8i0/8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732373699; c=relaxed/simple;
	bh=MPX52NKPzq9UmOKclhBZ7R00zuvXOYYqk6f+9zxyTMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ft9fWBh0vqDOifjyEWV6hDfD/7VV8ZUTb/MdvNR+Cuz6lnFO8FTmza53LCxDZC3u9oXIOWSYrd48TVD2hAZ76Fc/cM3Cnni7XYVxSJBunDNPTRSsgT9fM5HT96ldGQzDCiekwRRj+uBYPaLju6Ir3rI7NTfHPjJj4XMsSccCVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoMiZDcV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoMiZDcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732373697; x=1763909697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MPX52NKPzq9UmOKclhBZ7R00zuvXOYYqk6f+9zxyTMw=;
  b=OoMiZDcVExxrnsXLNgZ4qmys5Da8AZ9T8hsOZ04/I5qQsS6Z3IPzhsY7
   qEcO1qTjqHYIOyFb3wwwGA28OGQefA9AM/JwTrWqkeo6p5SCGR6IV0OQ0
   4f0Hhq/ukn3kToCNMGrNyLfAKBkZJhd5zHWMPRi3GGouQixw+rjSAoBIR
   mSm2H54OjDKh/irnmiKs/2udj4HpyfeSqstPC5Sc9BvJ8RxWvXODJnbhX
   DCNTWny9nqkm2N+GZsvoD6jiTzJvGVftiyid1242ED9a3P/XLfjU/522b
   nny5PuBRpXE8tMl8A5kfGd4xGFIkcorP38PWloiS8f5PeQYS4jJVQMOde
   A==;
X-CSE-ConnectionGUID: 0ZsPyamuTTekZgRB2LoSwQ==
X-CSE-MsgGUID: jDA0Z8TTQRapsqxguBWTRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="43922009"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="43922009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 06:54:56 -0800
X-CSE-ConnectionGUID: nqBXHmyxTTSVK35sZgb31w==
X-CSE-MsgGUID: DLeDQKN9S7+eKdhPPAv5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="90826603"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Nov 2024 06:54:55 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tErXA-0004hD-2N;
	Sat, 23 Nov 2024 14:54:52 +0000
Date: Sat, 23 Nov 2024 22:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/12]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb:
 /soc/pwrap@1000d000/pmic: failed to match any schema with compatible:
 ['mediatek,mt6366', 'mediatek,mt6358']
Message-ID: <202411232231.1LQgvtkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   df8c1b2852c0b86a1037c2e27705c67293feb40b
commit: 24da0611c5ccf9612839c2db48ae598295396fd0 [9/12] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Voltorb
config: arm64-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241123/202411232231.1LQgvtkU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411232231.1LQgvtkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411232231.1LQgvtkU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,chinchou-sku2' was expected
   	'google,steelix-rev0-sku196608' was expected
   	'google,tentacruel-sku262145' was expected
   	'google,tentacruel-sku262149' was expected
   	'google,spherion-rev1' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /: failed to match any schema with compatible: ['google,voltorb-rev0-sku589824', 'google,voltorb', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /: failed to match any schema with compatible: ['google,voltorb-rev0-sku589824', 'google,voltorb', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: pmic@6: compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: pmic@6: compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: jpeg-encoder@17030000: iommus: [[125, 233], [125, 234], [125, 235], [125, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,voltorb-rev0-sku589825', 'google,voltorb', 'mediatek,mt8186'] is too long
   	['google,voltorb-rev0-sku589825', 'google,voltorb', 'mediatek,mt8186'] is too short
   	'google,voltorb-rev0-sku589825' is not one of ['mediatek,mt2701-evb']
   	'google,voltorb-rev0-sku589825' is not one of ['mediatek,mt2712-evb']
   	'google,voltorb-rev0-sku589825' is not one of ['mediatek,mt6580-evbp1']
   	'google,voltorb-rev0-sku589825' is not one of ['prestigio,pmt5008-3g']
   	'google,voltorb-rev0-sku589825' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,voltorb-rev0-sku589825' is not one of ['mediatek,mt6592-evb']
   	'google,voltorb-rev0-sku589825' is not one of ['mediatek,mt6755-evb']
   	'google,voltorb-rev0-sku589825' is not one of ['mediatek,mt6765-evb']
--
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,kakadu' was expected
   	'google,chinchou-sku19' was expected
   	'google,chinchou-sku2' was expected
   	'google,steelix-rev0-sku196608' was expected
   	'google,tentacruel-sku262145' was expected
   	'google,tentacruel-sku262149' was expected
   	'google,spherion-rev1' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /: failed to match any schema with compatible: ['google,voltorb-rev0-sku589825', 'google,voltorb', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /: failed to match any schema with compatible: ['google,voltorb-rev0-sku589825', 'google,voltorb', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: pmic@6: compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: pmic@6: compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: touchscreen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: jpeg-encoder@17030000: iommus: [[125, 233], [125, 234], [125, 235], [125, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   	'google,chinchou-sku3' was expected
   	'google,steelix-rev1-sku196608' was expected
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /: failed to match any schema with compatible: ['google,voltorb-sku589825', 'google,voltorb-sku2147483647', 'google,voltorb-sku2147483391', 'google,voltorb', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /: failed to match any schema with compatible: ['google,voltorb-sku589825', 'google,voltorb-sku2147483647', 'google,voltorb-sku2147483391', 'google,voltorb', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /: failed to match any schema with compatible: ['google,voltorb-sku589825', 'google,voltorb-sku2147483647', 'google,voltorb-sku2147483391', 'google,voltorb', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /: failed to match any schema with compatible: ['google,voltorb-sku589825', 'google,voltorb-sku2147483647', 'google,voltorb-sku2147483391', 'google,voltorb', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
