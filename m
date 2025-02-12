Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5AC1FBC81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739395970; cv=none; b=U8cQg17ckVOACG7oqTWWVDD04sloDttlmgeibB7lvdiIlbicMOHcSVKQWRGMkinWPgwj4AHY3BbCseD8bZ30VQJDYtAJ9Q8MaMtaoDcCTeySr6gIzA1dz0dCuH2eOaxmzNZUh1eodqM0BBAZnf3VnSW9Cd+ExhGVtnyM02J8CZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739395970; c=relaxed/simple;
	bh=6uiNneDeJ9+haUQgZMw58ZjRsv5GvIKs3E/yPfjbYgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGgJigkpQSaJHnsqRT1MrEzKRQdXWZ4HJ5wuI5mPnSD695lQJaP2Ho2A7CwaeBrSg17IysXUXKHP+EU4Wg/AbQtv6XRBOv/xokfTXKhxocH6FPNOhCbOLRig1yBXazn42U7Slbmaev0dar5J8dd1KKwcugk+ZIgTna9Z4TVcDhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeRo8AQv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeRo8AQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739395967; x=1770931967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uiNneDeJ9+haUQgZMw58ZjRsv5GvIKs3E/yPfjbYgI=;
  b=ZeRo8AQvOQ2Y1ZsdVZWCC/lKXM3e6FcYzIqNVSznHR4w/eHfEoxjFvuC
   ywxcn1VOxCgDdhHTxWBdcaFIVdQHdaJCZR7mT9RFOYiqHoM8iogDyxftH
   VogGqBaKA9LFsDKMObBev0brZ9B23nL4cNt9YJqR4ALtG9E7J6pcd/6CU
   6EiiT7bhhFaX6RkbFT0PhyAozUIX3lcsMWR9gTpqL/Pu1GWrfCh39D4LA
   Z+DPvVGDVdGYkGxTaEUsFEd167RrDKgnbqqWgC3aoActu8QVUvHD9BAGt
   bT9gPWtRBocziPDyCe+swYXron9cnF+fX9CHsptRPdJFAlw+C9FETcPNL
   Q==;
X-CSE-ConnectionGUID: Ii80b4icR3ytVzFwbTRkQg==
X-CSE-MsgGUID: ZjYOdJjnTrKlZllfOX54sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65433151"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="65433151"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 13:32:47 -0800
X-CSE-ConnectionGUID: Otn96dDeRxyzTXTkbK+RNQ==
X-CSE-MsgGUID: De56oK7TS8G7FbLm+5ifPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136201946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2025 13:32:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiKLb-00169r-39;
	Wed, 12 Feb 2025 21:32:43 +0000
Date: Thu, 13 Feb 2025 05:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ovl@1c000000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502130525.4pbqIyzg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   981fa26789771f1135bd3ad0ae6869f0316ed68c
commit: c811521a05dfa97dc56c42b122f709258b2cd493 [2/2] dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL
config: arm64-randconfig-051-20250211 (https://download.01.org/0day-ci/archive/20250213/202502130525.4pbqIyzg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130525.4pbqIyzg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130525.4pbqIyzg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator: 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LDO5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[123567]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ovl@1c000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', 'mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-disp-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', 'mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt8186-disp-ovl', 'mediatek,mt8365-disp-ovl']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
