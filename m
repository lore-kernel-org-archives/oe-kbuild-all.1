Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60552BEC2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761884843; cv=none; b=P9QjL0C4QQdpcM6/fV3IyRHIoZCtcvNm1gRTz+T0ZaxPure0PW+qdI11hCLtvcLddijxw9wlTQ5WdrIaOs665m7UsyaKlkNzbQXdp7GKVroYfSJfWqWO6ieoR8eKUDnnRViKoSgfWRNI9bQQNPTJGJov87XyGROlZ3P5ucAtaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761884843; c=relaxed/simple;
	bh=NM76YnsX84PONMxJ8N6a3fMDqzEvhmuylXSupFZwTGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bjvy6nsNbQQUg9Hlf2u1Li0ZCSfWMP5d2u/eWvbJ8ibPtnYx8orr9SbQoCyf+OU6YGuxshuOuis5wA7q7ZymJ19uKaJ8XQaSD05dR02Sey80vWxWyfgOfAw6tWIr396kLRlsrX/B4ChajMHl6rdCj+EJZK0p0GLRbcWAiRi/p0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCsyA7y2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCsyA7y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761884840; x=1793420840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NM76YnsX84PONMxJ8N6a3fMDqzEvhmuylXSupFZwTGs=;
  b=HCsyA7y2IvmdrfNRi9jsYCucJ5/MFgo9eH9yjMGQvbWGFEbU2pQ85HGz
   DPR7aGI1geeAWDdHPnGqx9F1s/YL/t1s6ldnQYV0vbCVJvFzpnZ49UY9e
   cF71rjUlzupMvZRPy0nFBIGflEKWOVWIMTAPuZR6ygilf4rcZL7NyEH3Z
   0uaaOxmLF8D0XQJvE/QkJ+Mltq0yhRrtllcjOZNTso71ClC30Kw06J+q0
   0E0uGYvMxX/HVA/KRX7L40AqRU4dYERHB6rmaaQKS8zsOg6wAp0aV6ZEu
   rdWX3RCmqm+jSV3sQTggmi+KNhMxiZp467qkNs+w0aejmr/bshoOpP3+t
   Q==;
X-CSE-ConnectionGUID: /z8d0nJ6TOiSVqm0O7UqlQ==
X-CSE-MsgGUID: vPbeY9qiTUKFunbYxZ4wfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86663762"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="86663762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 21:27:18 -0700
X-CSE-ConnectionGUID: vEoaEX4bRBWdQIhtck0DwQ==
X-CSE-MsgGUID: kq5QxcwTTgeGRmM0jQyCcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="185346468"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 21:27:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEgjJ-000Mm2-1J;
	Fri, 31 Oct 2025 04:27:13 +0000
Date: Fri, 31 Oct 2025 12:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 247/247]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning
 (pci_device_reg): Failed prerequisite 'reg_format'
Message-ID: <202510311244.xImZM3UZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   653ade6d5c88bf540ed0db7cc7ed18a4ff0e5ef4
commit: cba23ab9c8db80308c131c066a5722f8952e6dc5 [247/247] CHROMIUM: arm64: dts: Add Bluetooth reset pin for chip:8196+7925
config: arm64-randconfig-003-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311244.xImZM3UZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311244.xImZM3UZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311244.xImZM3UZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2943.18-2946.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@530000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2948.18-2951.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2953.18-2956.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:310.33-314.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:315.30-319.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:367.34-371.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:381.32-385.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:111.9-121.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:131.11-140.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:310.33-314.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:315.30-319.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:367.34-371.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:381.32-385.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:111.9-121.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:131.11-140.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:310.33-314.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:315.30-319.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:367.34-371.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:381.32-385.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:111.9-121.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:131.11-140.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:310.33-314.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:315.30-319.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:367.34-371.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:381.32-385.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:111.9-121.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:131.11-140.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3482.10-3486.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3488.14-3492.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1380.8-1389.4: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:1384.15-1388.5: Warning (avoid_default_addr_size): /soc/usb1@16710000/hub@2/bluetooth@5: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
