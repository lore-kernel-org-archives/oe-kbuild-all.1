Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21328262BE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748778234; cv=none; b=YtzPkn7B9EpHX/LdMmPae56q1pcNgC12OF1nyKaTZS72PvozTlXl7eP0sj2G96Vc+l5ZYder4dpw2uU8Cw26+BegdAiZlXeNVSoavhq4QVY7Q/zADAAnkVyAAVaaVrkjnWjxEljXv7ij3getxPGuUPr3SVz0RCC/nV0SnYcaQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748778234; c=relaxed/simple;
	bh=V9RYN00bkq5qk/uSwqmyg6gurImTKZNkoaoo36ggFNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdjKL9Vk70QlU3Stox7tymL5c1IpFvPoMbd906xNlUoRYlHvmzZ9X4vAzPlLvyuN/52lI+pnddNMiClWOthxb0w29NnoQ2qQHxPFGUEfZ1vqJXQD2vudMgYxE0T/tUCXgIZx1wgmKVjO/2VUfhEqgg/6MqTkTgz3qKSdWKbbwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APevHUKU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APevHUKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748778232; x=1780314232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9RYN00bkq5qk/uSwqmyg6gurImTKZNkoaoo36ggFNk=;
  b=APevHUKU/isUHMHBFTnzPkOVvi9a7cWHir3sovmrDkg4NptLyO6gNFAo
   zWPipPsmIhtsCfoiqI6zMhP2BHluyuI5/fOwKKFUcYw7d4iZgz7sto7DU
   I+IH9hkWacYSxmz4CreyX9VBu1A5B/3v4UH9gmzcdsNbRVcUXmLQiSBil
   Ng8l9KeLW2P9pX92zLtvCEAQ54xWR0haWp6W9yp/Mi7mQCfx5df0+ArYE
   ky2QTFhYSlZQg6vrjewe7GAMJIkoEu2cgQjIys0sq3lk1dso3ja1IUbnu
   RoNZDoUTu943xBk/7oX9oa9+rJPvKcHgxSLaQPfgmpGN+J0TuotDakJFx
   w==;
X-CSE-ConnectionGUID: eIwUvP6vQImq1p1CDhHi5w==
X-CSE-MsgGUID: pJ7xRdDgQcuQbVt0ojiFzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62160842"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="62160842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 04:43:51 -0700
X-CSE-ConnectionGUID: +H6lA51eQi++yIMVGOSuBA==
X-CSE-MsgGUID: f2ssX2i0Q5CFqOtBHX5msA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="149084138"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Jun 2025 04:43:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLh6R-000Yv6-2X;
	Sun, 01 Jun 2025 11:43:47 +0000
Date: Sun, 1 Jun 2025 19:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359):
 'mt6359codec', 'mt6359rtc' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202506011901.cyKKhP1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 5bcecfcaa6d1d4ea1b29082ed1fd077ba4cccb55 [2/2] dt-bindings: mfd: mediatek: mt6397: Add ADC, CODEC and Regulators for MT6359
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250601/202506011901.cyKKhP1K-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011901.cyKKhP1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011901.cyKKhP1K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10006000 (mediatek,mt8188-scpsys): power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller (mediatek,mt8188-power-controller): power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic@34 (mediatek,mt6360): charger:usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: charger (mediatek,mt6360-chg): usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: regulator (mediatek,mt6360-regulator): buck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: eth-phy0@1 (ethernet-phy-id001c.c916): $nodename:0: 'eth-phy0@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: eth-phy0@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: t-phy@11e30000 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
