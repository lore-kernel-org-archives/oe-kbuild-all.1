Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778C1EEF9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807541; cv=none; b=gMWjGKRLR61e9W6v8VdwZfX7NWPV/qZmleeNxK7gP1Waa0aetMeL7bWd8vh4GZwbgDSRkgcCCOEThLsRGrKpnII3QnxFQdjB4siIvi4Gv0oizK8QhH4A263e6YSjx3vKSkcDkHaAorTPDWUt0MOBPf2vVnBPS20FkwNRji8+C1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807541; c=relaxed/simple;
	bh=abN/gLWBRgqAMlV96Wrq3uU3+jGxc65XD+JCinrj1gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=My7NfLW09q/NBtfQCM/YJkpfICsuD727OjDEd1F0CCjkGy+oB11bLv+ZtS2m/iOWwrKnPjYw+kCUQHxYtt4LzjWbKkdD3v8CfHxYPalkW8sV6jF0qpkv2f+RZ5SDaK1zCQo2l1ZuAOdmuGTHWKUjDZVvkZ3JraB1A2lisZYjmtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfsAfjSa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfsAfjSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746807538; x=1778343538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=abN/gLWBRgqAMlV96Wrq3uU3+jGxc65XD+JCinrj1gE=;
  b=PfsAfjSaURJkFiav87v33mLSE/TwdrjmjEJDq9Hjn6kMrFXbqAJmJi2D
   1vIGjF4mowaNCsx7js7ONrskng8AstfLCDmx3aKo2Y+8VeY8/l+wS0QWM
   5dUcO2izAqCj/lqYuevJADnTjNuHWyRqZBDCZgZ4KHHekNMUQec2VVT2a
   rzttt6ltnFAEraUf5/liQOyZlgWxjy8LtoimyYhWN5Chybw5Rwc9peUci
   Mv5wTINTgcKI+EVUER0MDunuXMD9yXAOi27WmRMGuouvOfksMcJ6v3hwt
   gRXMYWrnSHeQ48LUe3NYGV1N4oeeY6KFm5EjjcJpRyhqcoqnGk4+oDb1q
   w==;
X-CSE-ConnectionGUID: jMqvqDn9SUOr31ZtC9nMsA==
X-CSE-MsgGUID: QFFFSrZURDiyCE0O+Qz92A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48801315"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48801315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 09:18:57 -0700
X-CSE-ConnectionGUID: xuW6NpXkSzudEhhTW26MVQ==
X-CSE-MsgGUID: 9LXZNhWuQGOgrzeKVALSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137051679"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 09:18:56 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDQR3-0000ZW-1Z;
	Fri, 09 May 2025 16:18:53 +0000
Date: Sat, 10 May 2025 00:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /
 (google,dojo-sku7): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202505100047.foSVnNJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   30abd607a3ae1471331390c09e0379cac9b65ebf
commit: a4937eb8ac5cd5a6bacccdeaa41f29fc322a799b [1/1] UPSTREAM: arm64: mediatek: mt8195-cherry: Introduce the MT8195 Dojo Chromebook
config: arm64-randconfig-2051-20250505 (https://download.01.org/0day-ci/archive/20250510/202505100047.foSVnNJU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100047.foSVnNJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100047.foSVnNJU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:1987.18-1993.7: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:1994.18-1997.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3591.29-3595.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3597.22-3601.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3603.34-3607.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2994.17-3052.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3069.17-3106.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: / (google,dojo-sku7): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195'] is too long
   	['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195'] is too short
   	'google,dojo-sku7' is not one of ['mediatek,mt2701-evb']
   	'google,dojo-sku7' is not one of ['mediatek,mt2712-evb']
   	'google,dojo-sku7' is not one of ['mediatek,mt6580-evbp1']
   	'google,dojo-sku7' is not one of ['prestigio,pmt5008-3g']
   	'google,dojo-sku7' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,dojo-sku7' is not one of ['mediatek,mt6592-evb']
   	'google,dojo-sku7' is not one of ['mediatek,mt6755-evb']
   	'google,dojo-sku7' is not one of ['mediatek,mt6765-evb']
--
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	'google,elm-rev5' was expected
   	'google,hana-rev3' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,spherion' was expected
   	'google,elm-rev3' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /: failed to match any schema with compatible: ['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /: failed to match any schema with compatible: ['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /: failed to match any schema with compatible: ['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /: failed to match any schema with compatible: ['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /: failed to match any schema with compatible: ['google,dojo-sku7', 'google,dojo-sku5', 'google,dojo-sku3', 'google,dojo-sku1', 'google,dojo', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mt8195-sound (mediatek,mt8195_mt6359_max98390_rt5682): 'audio-routing', 'spk-playback-dai-link' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/mt8195-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ec@0 (google,cros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/lvts@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pwm@1100e000 (mediatek,mt8195-disp-pwm): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000 (mediatek,mt8195-gmac): tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dsi-phy@11c80000 (mediatek,mt8195-mipi-tx): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8195-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8195-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8195-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8195-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dsi-phy@11c90000 (mediatek,mt8195-mipi-tx): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8195-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8195-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8195-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8195-mipi-tx', 'mediatek,mt8183-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@38 (maxim,max98390): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@39 (maxim,max98390): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/i2c@11e03000/tpm@50: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: t-phy@11e30000 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: gpu@13000000 (mediatek,mt8195-mali): 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/gpu@13000000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/gpu@13000000/power_model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14001000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rdma']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14002000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-fg']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14003000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-stitch']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14004000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-hdr']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14005000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-aal']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14006000 (mediatek,mt8195-mdp3-rsz): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz'] is too long
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14006000 (mediatek,mt8195-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14006000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14007000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-tdshp']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14008000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-color']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14009000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-ovl']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@1400a000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-padding']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@1400b000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-tcc']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1400c000 (mediatek,mt8195-mdp3-wrot): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1400c000 (mediatek,mt8195-mdp3-wrot): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot'] is too long
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1400c000 (mediatek,mt8195-mdp3-wrot): iommus:0: [126, 131] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1400c000 (mediatek,mt8195-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@1400c000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f06000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-split']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f07000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-tcc']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14f08000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rdma']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14f09000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rdma']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14f0a000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rdma']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f0b000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-fg']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f0c000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-fg']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f0d000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-fg']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f0e000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-hdr']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f0f000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-hdr']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f10000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-hdr']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f11000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-aal']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f12000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-aal']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f13000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-aal']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f14000 (mediatek,mt8195-mdp3-rsz): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz'] is too long
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f14000 (mediatek,mt8195-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f14000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f15000 (mediatek,mt8195-mdp3-rsz): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz'] is too long
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f15000 (mediatek,mt8195-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f15000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f16000 (mediatek,mt8195-mdp3-rsz): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz'] is too long
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-rsz' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f16000 (mediatek,mt8195-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f16000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-rsz', 'mediatek,mt8183-mdp3-rsz']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f17000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-tdshp']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f18000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-tdshp']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f19000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-tdshp']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f1a000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-merge']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f1b000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-merge']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f1c000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-color']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f1d000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-color']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f1e000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-color']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f1f000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-ovl']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f20000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-padding']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f21000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-padding']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/display@14f22000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-padding']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f23000 (mediatek,mt8195-mdp3-wrot): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f23000 (mediatek,mt8195-mdp3-wrot): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot'] is too long
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f23000 (mediatek,mt8195-mdp3-wrot): iommus:0: [144, 163] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f23000 (mediatek,mt8195-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14f23000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f24000 (mediatek,mt8195-mdp3-wrot): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f24000 (mediatek,mt8195-mdp3-wrot): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot'] is too long
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f24000 (mediatek,mt8195-mdp3-wrot): iommus:0: [144, 166] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f24000 (mediatek,mt8195-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14f24000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f25000 (mediatek,mt8195-mdp3-wrot): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f25000 (mediatek,mt8195-mdp3-wrot): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot'] is too long
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3']
   	'mediatek,mt8195-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma', 'mediatek,mt8183-mdp3-rsz', 'mediatek,mt8183-mdp3-wdma', 'mediatek,mt8183-mdp3-wrot', 'mediatek,mt8183-mdp3-ccorr']
   	'mediatek,mt8183-mdp3-wrot' is not one of ['mediatek,mt8183-mdp3-rdma']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f25000 (mediatek,mt8195-mdp3-wrot): iommus:0: [126, 194] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@14f25000 (mediatek,mt8195-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dma-controller@14f25000: failed to match any schema with compatible: ['mediatek,mt8195-mdp3-wrot', 'mediatek,mt8183-mdp3-wrot']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dsi@1c008000 (mediatek,mt8195-dsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dsi@1c008000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dsi@1c012000 (mediatek,mt8195-dsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi'] is too long
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt2701-dsi', 'mediatek,mt7623-dsi', 'mediatek,mt8167-dsi', 'mediatek,mt8173-dsi', 'mediatek,mt8183-dsi', 'mediatek,mt8186-dsi', 'mediatek,mt8188-dsi']
   	'mediatek,mt8195-dsi' is not one of ['mediatek,mt6795-dsi']
   	'mediatek,mt8173-dsi' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/dsi@1c012000: failed to match any schema with compatible: ['mediatek,mt8195-dsi', 'mediatek,mt8183-dsi']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c015000 (mediatek,mt8195-dp-intf): clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c015000 (mediatek,mt8195-dp-intf): clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mutex@1c101000 (mediatek,mt8195-disp-mutex): 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c104000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c105000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c106000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c107000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c108000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c109000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c10a000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c10b000 (mediatek,mt8195-vdo1-rdma): '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000 (mediatek,mt8195-dp-intf): Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000 (mediatek,mt8195-dp-intf): clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000 (mediatek,mt8195-dp-intf): clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000 (mediatek,mt8195-edp-tx): 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
