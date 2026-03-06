Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391DA3382F0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797742; cv=none; b=kpQlnlbJjCWGp1qmeIMdPxW6ylh0TxErTVFskEIf01sI3sVITtSaNpPdSOnssJNk+CTtQMJMMoqHfcGjxPq9Pvdb675jStyh7GaebRAML3ZJmfp28zY7Yc9CSgCArA8gdCqdQ+K8eI/M7JgBo6TUagDha4R35j5XYsTzzOkCAqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797742; c=relaxed/simple;
	bh=bAy5T+v/IKVW/8tcqixWoT0SEN12MqHWxDkkC+x7iaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J4fY3/za4gNNEAzZtrUgECsaIsUzRsRU5FyC7oqJMPeIpXn490hWJiqtzW61mJwok70MFgiEe14f5KR7eAKofY5mWhs2wZn9tB4iYl+zw1j8zVciiGiZbQ+P66ZYuT8ScihGCjVuikeTnZHCRVXOGvhRU2j70n93rl6I35JSr7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur2CqgmK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur2CqgmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772797739; x=1804333739;
  h=date:from:to:cc:subject:message-id;
  bh=bAy5T+v/IKVW/8tcqixWoT0SEN12MqHWxDkkC+x7iaI=;
  b=Ur2CqgmKrXCSjRQLzIVnJRv/txYV7Tv//6YWxx2NRK7oa5eINu4ZE+pa
   ZQxlaux+/SRtwcm7zhtZXBn57FOijgqAQaC5sbgF9tUZ+NSIiTEv5mibX
   n3jG+ZyuAZZvE7j8yxTZwijQ13zk4nXapP4gfPtg2T9TfwbErdpsR89JY
   0m9nW0E5JE0cC78jQ6NG/4eO9eRbdKauOg9CjhBgCbbpuWd07b+z8OE9N
   77HkuYRXSbto0UnL4A5DlUQjoO1/k9K2nv5XiWcm4YRQetryWwCXTGf9S
   0H05EihoTBKr0kIaWGuTQcbGs5a4C048GYaewC5eewx1p3eF3gjFvU0Iv
   g==;
X-CSE-ConnectionGUID: umE4twQQTR2nxwrFj4Ww8w==
X-CSE-MsgGUID: FCwHXm3RSvm+78NftC/FLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61476969"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="61476969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:48:58 -0800
X-CSE-ConnectionGUID: dCavkzQJRpyBgyW7kYTS3w==
X-CSE-MsgGUID: 2j/mzdN5Ty+xRmKJESJqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223113992"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 03:48:56 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyTfq-000000002Ez-0ctQ;
	Fri, 06 Mar 2026 11:48:54 +0000
Date: Fri, 06 Mar 2026 12:47:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: vi@54080000
 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202603061247.JZqlmVFE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   d8f2eda3a65a34273481d9d2a5b573235ffe1485
commit: 2cf244db791ab26b7be4d50b651a3b6d5d83a9a2 [1/1] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
config: arm-randconfig-2051-20260227 (https://download.01.org/0day-ci/archive/20260306/202603061247.JZqlmVFE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061247.JZqlmVFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061247.JZqlmVFE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77663']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77663']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts:55.22-61.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts:48.22-54.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:52.22-58.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:52.22-58.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-ouya.dts:46.22-52.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']
--
   arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts:57.22-63.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /host1x@50000000/vi@54080000/csi@800: failed to match any schema with compatible: ['nvidia,tegra30-csi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
