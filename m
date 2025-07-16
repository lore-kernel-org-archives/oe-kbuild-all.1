Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1A1323E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752709557; cv=none; b=EmzZ/+FzAD0DDRCnFaQ2ALjpE97BObFyMbok9WSrcJ82W2RtkMeh9P2Xbd9Py+XNhgOFqBwJpOgwJRwsRm379YYzh0bAygxOqG5eqwYzbMyfQD+olWNaBWc7qsTopFWUPUJrwcdAT5J42llC/Mi5ew0vx8DhIbUQ4xQb5yUuSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752709557; c=relaxed/simple;
	bh=5vGtB3oCbEaJcPEnETWxBxUFZunVAcObUjyuz5PA6dE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1tHjR1iCMTe14IUXep1qQ9bfWjXnv0x6PF69s9pwsF54jS7eBbZFQjpW0MTDdP27mEc6DzL5NClxYkBBsB2l0TFlzKeLwxFeNaOLXEJqGbPkajww+bksLthuoVUNHdJZmxgoPbaVTleeQV6C0qBasF9i+ij3+kqPg02KDohR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEq73Ivl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEq73Ivl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752709555; x=1784245555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vGtB3oCbEaJcPEnETWxBxUFZunVAcObUjyuz5PA6dE=;
  b=GEq73IvlT01FzURYPIUhVLeSt+7p0H/D0JuV0Rp5pib2TOUeKU3QFNu7
   X8KJftZVsURMKjYpB1/37nzFHSItFjqPxm6rWEQwujMvXYJHmZf8VtxZl
   RBTJw6wPTgpwK6whgk5x01y07vNX5Ya45OjDgbO76TfgTF76fVLERzVbg
   a6Zhd5sg+PAgPuVZNpZzaGuxNGWNqmRSfOcgXpHslxhUDOx7GITfNKQvq
   +FshwMDsnvHiQzwlSRfLywlLo6xV6MUXYP9rb46/YEc63SytVb8IClnTB
   SxDRsgjY8O/hB8Kv8ABQFA0ATFlJ5E7cMKPItx4MlHmSmnwJIOBnGxrRd
   w==;
X-CSE-ConnectionGUID: PfI+dAE1SfqIVaFnx1dpxw==
X-CSE-MsgGUID: 29hAt4XPRuCFSIwwFrwlDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58780573"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="58780573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 16:45:54 -0700
X-CSE-ConnectionGUID: 2RMeThPdTWGjV9GarSOV1w==
X-CSE-MsgGUID: 1kHbzqwxSAy5f2jG3L0UFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="157741472"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2025 16:45:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucBos-000Cxh-2y;
	Wed, 16 Jul 2025 23:45:50 +0000
Date: Thu, 17 Jul 2025 07:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-06 9/9]
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb:
 video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required
 property
Message-ID: <202507170758.1UmgRZFG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-06
head:   233cd6b58e4f649fb1ae02fb654ee3c7b0cea9f1
commit: 944be6fba401639e5bf2a8bc9f5e781e6cc4b4d4 [9/9] arm64: dts: rockchip: Add VPU support for RK3568/RK3566
config: arm64-randconfig-051-20250709 (https://download.01.org/0day-ci/archive/20250717/202507170758.1UmgRZFG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507170758.1UmgRZFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507170758.1UmgRZFG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /i2c@fdd40000/regulator@40: failed to match any schema with compatible: ['fcs,fan53555']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: hdmi@fe0a0000 (rockchip,rk3568-dw-hdmi): Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: i2c@fe5b0000 (rockchip,rk3568-i2c): Unevaluated properties are not allowed ('pintctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-rk3x.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /serial@fe650000/bluetooth: failed to match any schema with compatible: ['realtek,rtl8821cs-bt']
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
--
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /i2c@fdd40000/regulator@40: failed to match any schema with compatible: ['fcs,fan53555']
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: hdmi@fe0a0000 (rockchip,rk3568-dw-hdmi): Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /serial@fe650000/bluetooth: failed to match any schema with compatible: ['realtek,rtl8821cs-bt']
   arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
--
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /i2c@fe5a0000/digitizer@9: failed to match any schema with compatible: ['wacom,w9013', 'hid-over-i2c']
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /i2c@fe5a0000/digitizer@9: failed to match any schema with compatible: ['wacom,w9013', 'hid-over-i2c']
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: bluetooth (brcm,bcm43438-bt): 'device-wake-gpios', 'host-wake-gpios' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/broadcom-bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: bluetooth (brcm,bcm43438-bt): reset-gpios: False schema does not allow [[33, 20, 1]]
   	from schema $id: http://devicetree.org/schemas/net/broadcom-bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-inno-usb2.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: hdmi@fe0a0000 (rockchip,rk3568-dw-hdmi): Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: pcie@fe260000 (rockchip,rk3568-pcie): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /gpio_fan: failed to match any schema with compatible: ['gpio-fan']
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: vcc3v3_sd (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: pmic@20 (rockchip,rk809): '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: pcie@fe260000 (rockchip,rk3568-pcie): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
--
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
--
   arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
--
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: usb@fcc00000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'extcon', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: hdmi@fe0a0000 (rockchip,rk3568-dw-hdmi): Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /i2c@fe5c0000/rtc@51: failed to match any schema with compatible: ['haoyu,hym8563']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /syscon@fdcb8000: failed to match any schema with compatible: ['rockchip,rk3568-pcie3-phy-grf', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /phy@fe8c0000: failed to match any schema with compatible: ['rockchip,rk3568-pcie3-phy']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: pcie@fe270000 (rockchip,rk3568-pcie): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: pmic@20 (rockchip,rk809): '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: hdmi@fe0a0000 (rockchip,rk3568-dw-hdmi): Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'vbus-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-inno-usb2.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /syscon@fdcb8000: failed to match any schema with compatible: ['rockchip,rk3568-pcie3-phy-grf', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /phy@fe8c0000: failed to match any schema with compatible: ['rockchip,rk3568-pcie3-phy']
--
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: usb@fd000000 (rockchip,rk3568-dwc3): Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pmic@20 (rockchip,rk809): '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: video-codec@fdea0400 (rockchip,rk3568-vpu): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('rx-queues-config', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: hdmi@fe0a0000 (rockchip,rk3568-dw-hdmi): Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pcie@fe260000 (rockchip,rk3568-pcie): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /i2c@fe5e0000/rtc@51: failed to match any schema with compatible: ['haoyu,hym8563']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /phy@fe870000: failed to match any schema with compatible: ['rockchip,rk3568-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'vbus-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
