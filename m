Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EAB45025
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718462852; cv=none; b=TItN6nEweL9k+6GNiey7qwQMbAMoWaYsz8PI21suEC+Q+P/GACNVi+kMBigzZpp5cpb/fecynGZrYXv0QRwuRiMuf7WZusd57CIhUc7aT7BkVFFo50mS3mRBWVF0U/ghX8KGsBanBz1VQxSodUbjxorH9wcIq3AHSuowPhCYrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718462852; c=relaxed/simple;
	bh=waISalP5nQ5GHMIxUJHLXDn+G4NPuoPL2C3HMD8RYKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dlxSg91OA4sQgOlKdJ7LiwoAtxjPVz0owOnG3DUWeTWCWIZ607qxGIrRRmv4jItZpaZIUA2jw0LN2z+YrPolmgTcpzqSd0y3i5HtmsJIUqIqzetKH+Ao5AwZDJIIDcqSO/cB//Btlio9WPZXE54WdQ9rUicdCPqSjyG9xWpaFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDTN7Mbt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDTN7Mbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718462846; x=1749998846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=waISalP5nQ5GHMIxUJHLXDn+G4NPuoPL2C3HMD8RYKY=;
  b=WDTN7MbtxbEzeOVgcln2AynkGbjrWW6N99Gw2fkrvII+2FpSFgb1jAY0
   XuDo1fmdkUEIbpZdQUDNAnsXPpXO1s8b+78O/gy3iDDeknX0nXyNgoeuS
   RxzB4+W3Kyq//g4WZxHKrCsLYxAhxBLxBzcWZhgYDS1ryd53Bj5xZPWD4
   E7T/X3+V5pAUO4pT2ZkWdxNYZBiWrQ3xt2CTHPulOCDYkTQw3X+WiF3lC
   HafYYNwMW/K+KVyNK9NXAuokr3mFUV3GBGHvS9Ot9mL6IYiQqZlK+YArP
   vnZ4mukK2YGjCzcQRimbq20xjwZRBsJg05kOh1EoZdCCkKtmrhx0HgQmP
   Q==;
X-CSE-ConnectionGUID: KyN67KVQRpWnBEAHHBS9Wg==
X-CSE-MsgGUID: vatoHtm7SXqeiq4EbdyjiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="18267624"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="18267624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 07:47:24 -0700
X-CSE-ConnectionGUID: AmPZD2FjTmCDIZYtI/hBHA==
X-CSE-MsgGUID: AZ7l99adSkyL/ug5j/yo0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40880988"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2024 07:47:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIUgZ-00007a-10;
	Sat, 15 Jun 2024 14:47:19 +0000
Date: Sat, 15 Jun 2024 22:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip 27/27]
 arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning
 (unique_unit_address_if_enabled):
 /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate
 unit-address (also used in node
 /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-coun...
Message-ID: <202406152227.bn7p9Hvz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   85037f19134405ea5f8469588c58cf9b32ad6499
commit: 85037f19134405ea5f8469588c58cf9b32ad6499 [27/27] fixup! arm64: dts: apple: t8112: Add PMU NVMEM and SMC RTC/reboot nodes
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406152227.bn7p9Hvz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152227.bn7p9Hvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152227.bn7p9Hvz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j413.dts:185.14-195.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:197.14-206.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   panel: size (25) error for type phandle
   arch/arm64/boot/dts/apple/t8112-j413.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j415.dts:203.14-217.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j415.dts:219.14-228.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   panel: size (25) error for type phandle
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /: failed to match any schema with compatible: ['apple,j415', 'apple,t8112', 'apple,arm-platform']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j473.dts:168.14-177.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:179.14-188.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: soc: display-subsystem: 'ranges' is a required property
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j493.dts:189.14-199.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:201.14-210.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   panel: size (25) error for type phandle
   arch/arm64/boot/dts/apple/t8112-j493.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@23c500000: failed to match any schema with compatible: ['apple,t8112-dptx-phy', 'apple,dptx-phy']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']

vim +1148 arch/arm64/boot/dts/apple/t8112.dtsi

2d5ce3fbef3242 Hector Martin     2023-03-07    16  
2d5ce3fbef3242 Hector Martin     2023-03-07    17  / {
2d5ce3fbef3242 Hector Martin     2023-03-07    18  	compatible = "apple,t8112", "apple,arm-platform";
2d5ce3fbef3242 Hector Martin     2023-03-07    19  
2d5ce3fbef3242 Hector Martin     2023-03-07    20  	#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    21  	#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    22  
127154a419bf49 Asahi Lina        2022-11-25    23  	aliases {
127154a419bf49 Asahi Lina        2022-11-25    24  		gpu = &gpu;
127154a419bf49 Asahi Lina        2022-11-25    25  	};
127154a419bf49 Asahi Lina        2022-11-25    26  
2d5ce3fbef3242 Hector Martin     2023-03-07    27  	cpus {
2d5ce3fbef3242 Hector Martin     2023-03-07    28  		#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    29  		#size-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    30  
2d5ce3fbef3242 Hector Martin     2023-03-07    31  		cpu-map {
2d5ce3fbef3242 Hector Martin     2023-03-07    32  			cluster0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    33  				core0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    34  					cpu = <&cpu_e0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    35  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    36  				core1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    37  					cpu = <&cpu_e1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    38  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    39  				core2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    40  					cpu = <&cpu_e2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    41  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    42  				core3 {
2d5ce3fbef3242 Hector Martin     2023-03-07    43  					cpu = <&cpu_e3>;
2d5ce3fbef3242 Hector Martin     2023-03-07    44  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    45  			};
2d5ce3fbef3242 Hector Martin     2023-03-07    46  
2d5ce3fbef3242 Hector Martin     2023-03-07    47  			cluster1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    48  				core0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    49  					cpu = <&cpu_p0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    50  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    51  				core1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    52  					cpu = <&cpu_p1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    53  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    54  				core2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    55  					cpu = <&cpu_p2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    56  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    57  				core3 {
2d5ce3fbef3242 Hector Martin     2023-03-07    58  					cpu = <&cpu_p3>;
2d5ce3fbef3242 Hector Martin     2023-03-07    59  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    60  			};
2d5ce3fbef3242 Hector Martin     2023-03-07    61  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    62  
2d5ce3fbef3242 Hector Martin     2023-03-07    63  		cpu_e0: cpu@0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    64  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    65  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    66  			reg = <0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    67  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    68  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    69  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    70  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    71  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    72  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    73  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    74  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    75  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    76  
2d5ce3fbef3242 Hector Martin     2023-03-07    77  		cpu_e1: cpu@1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    78  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    79  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    80  			reg = <0x0 0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    81  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    82  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    83  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    84  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    85  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    86  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    87  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    88  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    89  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    90  
2d5ce3fbef3242 Hector Martin     2023-03-07    91  		cpu_e2: cpu@2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    92  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    93  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    94  			reg = <0x0 0x2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    95  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    96  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    97  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    98  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    99  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07   100  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   101  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   102  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   103  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   104  
2d5ce3fbef3242 Hector Martin     2023-03-07   105  		cpu_e3: cpu@3 {
2d5ce3fbef3242 Hector Martin     2023-03-07   106  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07   107  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   108  			reg = <0x0 0x3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   109  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   110  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   111  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   112  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07   113  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07   114  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   115  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   116  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   117  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   118  
2d5ce3fbef3242 Hector Martin     2023-03-07   119  		cpu_p0: cpu@10100 {
2d5ce3fbef3242 Hector Martin     2023-03-07   120  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   121  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   122  			reg = <0x0 0x10100>;
2d5ce3fbef3242 Hector Martin     2023-03-07   123  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   124  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   125  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   126  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   127  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   128  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   129  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   130  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   131  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   132  
2d5ce3fbef3242 Hector Martin     2023-03-07   133  		cpu_p1: cpu@10101 {
2d5ce3fbef3242 Hector Martin     2023-03-07   134  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   135  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   136  			reg = <0x0 0x10101>;
2d5ce3fbef3242 Hector Martin     2023-03-07   137  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   138  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   139  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   140  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   141  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   142  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   143  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   144  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   145  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   146  
2d5ce3fbef3242 Hector Martin     2023-03-07   147  		cpu_p2: cpu@10102 {
2d5ce3fbef3242 Hector Martin     2023-03-07   148  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   149  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   150  			reg = <0x0 0x10102>;
2d5ce3fbef3242 Hector Martin     2023-03-07   151  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   152  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   153  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   154  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   155  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   156  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   157  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   158  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   159  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   160  
2d5ce3fbef3242 Hector Martin     2023-03-07   161  		cpu_p3: cpu@10103 {
2d5ce3fbef3242 Hector Martin     2023-03-07   162  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   163  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   164  			reg = <0x0 0x10103>;
2d5ce3fbef3242 Hector Martin     2023-03-07   165  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   166  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   167  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   168  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   169  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   170  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   171  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   172  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   173  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   174  
2d5ce3fbef3242 Hector Martin     2023-03-07   175  		l2_cache_0: l2-cache-0 {
2d5ce3fbef3242 Hector Martin     2023-03-07   176  			compatible = "cache";
2d5ce3fbef3242 Hector Martin     2023-03-07   177  			cache-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   178  			cache-unified;
2d5ce3fbef3242 Hector Martin     2023-03-07   179  			cache-size = <0x400000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   180  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   181  
2d5ce3fbef3242 Hector Martin     2023-03-07   182  		l2_cache_1: l2-cache-1 {
2d5ce3fbef3242 Hector Martin     2023-03-07   183  			compatible = "cache";
2d5ce3fbef3242 Hector Martin     2023-03-07   184  			cache-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   185  			cache-unified;
2d5ce3fbef3242 Hector Martin     2023-03-07   186  			cache-size = <0x1000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   187  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   188  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   189  
2d5ce3fbef3242 Hector Martin     2023-03-07   190  	ecluster_opp: opp-table-0 {
2d5ce3fbef3242 Hector Martin     2023-03-07   191  		compatible = "operating-points-v2";
2d5ce3fbef3242 Hector Martin     2023-03-07   192  		opp-shared;
2d5ce3fbef3242 Hector Martin     2023-03-07   193  
2d5ce3fbef3242 Hector Martin     2023-03-07   194  		opp01 {
2d5ce3fbef3242 Hector Martin     2023-03-07   195  			opp-hz = /bits/ 64 <600000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   196  			opp-level = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   197  			clock-latency-ns = <7500>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   198  			opp-microwatt = <26000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   199  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   200  		opp02 {
2d5ce3fbef3242 Hector Martin     2023-03-07   201  			opp-hz = /bits/ 64 <912000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   202  			opp-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   203  			clock-latency-ns = <20000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   204  			opp-microwatt = <56000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   205  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   206  		opp03 {
2d5ce3fbef3242 Hector Martin     2023-03-07   207  			opp-hz = /bits/ 64 <1284000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   208  			opp-level = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   209  			clock-latency-ns = <22000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   210  			opp-microwatt = <88000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   211  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   212  		opp04 {
2d5ce3fbef3242 Hector Martin     2023-03-07   213  			opp-hz = /bits/ 64 <1752000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   214  			opp-level = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   215  			clock-latency-ns = <30000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   216  			opp-microwatt = <155000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   217  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   218  		opp05 {
2d5ce3fbef3242 Hector Martin     2023-03-07   219  			opp-hz = /bits/ 64 <2004000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   220  			opp-level = <5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   221  			clock-latency-ns = <35000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   222  			opp-microwatt = <231000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   223  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   224  		opp06 {
2d5ce3fbef3242 Hector Martin     2023-03-07   225  			opp-hz = /bits/ 64 <2256000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   226  			opp-level = <6>;
2d5ce3fbef3242 Hector Martin     2023-03-07   227  			clock-latency-ns = <39000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   228  			opp-microwatt = <254000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   229  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   230  		opp07 {
2d5ce3fbef3242 Hector Martin     2023-03-07   231  			opp-hz = /bits/ 64 <2424000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   232  			opp-level = <7>;
2d5ce3fbef3242 Hector Martin     2023-03-07   233  			clock-latency-ns = <53000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   234  			opp-microwatt = <351000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   235  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   236  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   237  
2d5ce3fbef3242 Hector Martin     2023-03-07   238  	pcluster_opp: opp-table-1 {
2d5ce3fbef3242 Hector Martin     2023-03-07   239  		compatible = "operating-points-v2";
2d5ce3fbef3242 Hector Martin     2023-03-07   240  		opp-shared;
2d5ce3fbef3242 Hector Martin     2023-03-07   241  
2d5ce3fbef3242 Hector Martin     2023-03-07   242  		opp01 {
2d5ce3fbef3242 Hector Martin     2023-03-07   243  			opp-hz = /bits/ 64 <660000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   244  			opp-level = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   245  			clock-latency-ns = <9000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   246  			opp-microwatt = <133000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   247  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   248  		opp02 {
2d5ce3fbef3242 Hector Martin     2023-03-07   249  			opp-hz = /bits/ 64 <924000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   250  			opp-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   251  			clock-latency-ns = <19000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   252  			opp-microwatt = <212000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   253  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   254  		opp03 {
2d5ce3fbef3242 Hector Martin     2023-03-07   255  			opp-hz = /bits/ 64 <1188000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   256  			opp-level = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   257  			clock-latency-ns = <22000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   258  			opp-microwatt = <261000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   259  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   260  		opp04 {
2d5ce3fbef3242 Hector Martin     2023-03-07   261  			opp-hz = /bits/ 64 <1452000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   262  			opp-level = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   263  			clock-latency-ns = <24000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   264  			opp-microwatt = <345000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   265  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   266  		opp05 {
2d5ce3fbef3242 Hector Martin     2023-03-07   267  			opp-hz = /bits/ 64 <1704000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   268  			opp-level = <5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   269  			clock-latency-ns = <26000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   270  			opp-microwatt = <441000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   271  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   272  		opp06 {
2d5ce3fbef3242 Hector Martin     2023-03-07   273  			opp-hz = /bits/ 64 <1968000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   274  			opp-level = <6>;
2d5ce3fbef3242 Hector Martin     2023-03-07   275  			clock-latency-ns = <28000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   276  			opp-microwatt = <619000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   277  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   278  		opp07 {
2d5ce3fbef3242 Hector Martin     2023-03-07   279  			opp-hz = /bits/ 64 <2208000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   280  			opp-level = <7>;
2d5ce3fbef3242 Hector Martin     2023-03-07   281  			clock-latency-ns = <30000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   282  			opp-microwatt = <740000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   283  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   284  		opp08 {
2d5ce3fbef3242 Hector Martin     2023-03-07   285  			opp-hz = /bits/ 64 <2400000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   286  			opp-level = <8>;
2d5ce3fbef3242 Hector Martin     2023-03-07   287  			clock-latency-ns = <33000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   288  			opp-microwatt = <855000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   289  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   290  		opp09 {
2d5ce3fbef3242 Hector Martin     2023-03-07   291  			opp-hz = /bits/ 64 <2568000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   292  			opp-level = <9>;
2d5ce3fbef3242 Hector Martin     2023-03-07   293  			clock-latency-ns = <34000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   294  			opp-microwatt = <1006000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   295  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   296  		opp10 {
2d5ce3fbef3242 Hector Martin     2023-03-07   297  			opp-hz = /bits/ 64 <2724000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   298  			opp-level = <10>;
2d5ce3fbef3242 Hector Martin     2023-03-07   299  			clock-latency-ns = <36000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   300  			opp-microwatt = <1217000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   301  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   302  		opp11 {
2d5ce3fbef3242 Hector Martin     2023-03-07   303  			opp-hz = /bits/ 64 <2868000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   304  			opp-level = <11>;
2d5ce3fbef3242 Hector Martin     2023-03-07   305  			clock-latency-ns = <41000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   306  			opp-microwatt = <1534000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   307  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   308  		opp12 {
2d5ce3fbef3242 Hector Martin     2023-03-07   309  			opp-hz = /bits/ 64 <2988000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   310  			opp-level = <12>;
2d5ce3fbef3242 Hector Martin     2023-03-07   311  			clock-latency-ns = <42000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   312  			opp-microwatt = <1714000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   313  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   314  		opp13 {
2d5ce3fbef3242 Hector Martin     2023-03-07   315  			opp-hz = /bits/ 64 <3096000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   316  			opp-level = <13>;
2d5ce3fbef3242 Hector Martin     2023-03-07   317  			clock-latency-ns = <44000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   318  			opp-microwatt = <1877000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   319  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   320  		opp14 {
2d5ce3fbef3242 Hector Martin     2023-03-07   321  			opp-hz = /bits/ 64 <3204000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   322  			opp-level = <14>;
2d5ce3fbef3242 Hector Martin     2023-03-07   323  			clock-latency-ns = <46000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   324  			opp-microwatt = <2159000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   325  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   326  		opp15 {
2d5ce3fbef3242 Hector Martin     2023-03-07   327  			opp-hz = /bits/ 64 <3324000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   328  			opp-level = <15>;
2d5ce3fbef3242 Hector Martin     2023-03-07   329  			clock-latency-ns = <62000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   330  			opp-microwatt = <2393000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   331  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   332  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   333  		opp16 {
2d5ce3fbef3242 Hector Martin     2023-03-07   334  			opp-hz = /bits/ 64 <3408000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   335  			opp-level = <16>;
2d5ce3fbef3242 Hector Martin     2023-03-07   336  			clock-latency-ns = <62000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   337  			opp-microwatt = <2497000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   338  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   339  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   340  		opp17 {
2d5ce3fbef3242 Hector Martin     2023-03-07   341  			opp-hz = /bits/ 64 <3504000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   342  			opp-level = <17>;
2d5ce3fbef3242 Hector Martin     2023-03-07   343  			clock-latency-ns = <62000>;
d2dd5966a4d1a2 James Calligeros  2023-09-03   344  			opp-microwatt = <2648000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   345  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   346  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   347  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   348  
127154a419bf49 Asahi Lina        2022-11-25   349  	gpu_opp: opp-table-gpu {
127154a419bf49 Asahi Lina        2022-11-25   350  		compatible = "operating-points-v2";
127154a419bf49 Asahi Lina        2022-11-25   351  
127154a419bf49 Asahi Lina        2022-11-25   352  		/*
127154a419bf49 Asahi Lina        2022-11-25   353  		 * NOTE: The voltage and power values are device-specific and
127154a419bf49 Asahi Lina        2022-11-25   354  		 * must be filled in by the bootloader.
127154a419bf49 Asahi Lina        2022-11-25   355  		 */
127154a419bf49 Asahi Lina        2022-11-25   356  		opp00 {
127154a419bf49 Asahi Lina        2022-11-25   357  			opp-hz = /bits/ 64 <0>;
127154a419bf49 Asahi Lina        2022-11-25   358  			opp-microvolt = <400000>;
127154a419bf49 Asahi Lina        2022-11-25   359  			opp-microwatt = <0>;
127154a419bf49 Asahi Lina        2022-11-25   360  		};
127154a419bf49 Asahi Lina        2022-11-25   361  		opp01 {
127154a419bf49 Asahi Lina        2022-11-25   362  			opp-hz = /bits/ 64 <444000000>;
127154a419bf49 Asahi Lina        2022-11-25   363  			opp-microvolt = <603000>;
127154a419bf49 Asahi Lina        2022-11-25   364  			opp-microwatt = <4295000>;
127154a419bf49 Asahi Lina        2022-11-25   365  		};
127154a419bf49 Asahi Lina        2022-11-25   366  		opp02 {
127154a419bf49 Asahi Lina        2022-11-25   367  			opp-hz = /bits/ 64 <612000000>;
127154a419bf49 Asahi Lina        2022-11-25   368  			opp-microvolt = <675000>;
127154a419bf49 Asahi Lina        2022-11-25   369  			opp-microwatt = <6251000>;
127154a419bf49 Asahi Lina        2022-11-25   370  		};
127154a419bf49 Asahi Lina        2022-11-25   371  		opp03 {
127154a419bf49 Asahi Lina        2022-11-25   372  			opp-hz = /bits/ 64 <808000000>;
127154a419bf49 Asahi Lina        2022-11-25   373  			opp-microvolt = <710000>;
127154a419bf49 Asahi Lina        2022-11-25   374  			opp-microwatt = <8625000>;
127154a419bf49 Asahi Lina        2022-11-25   375  		};
127154a419bf49 Asahi Lina        2022-11-25   376  		opp04 {
127154a419bf49 Asahi Lina        2022-11-25   377  			opp-hz = /bits/ 64 <968000000>;
127154a419bf49 Asahi Lina        2022-11-25   378  			opp-microvolt = <775000>;
127154a419bf49 Asahi Lina        2022-11-25   379  			opp-microwatt = <11948000>;
127154a419bf49 Asahi Lina        2022-11-25   380  		};
127154a419bf49 Asahi Lina        2022-11-25   381  		opp05 {
127154a419bf49 Asahi Lina        2022-11-25   382  			opp-hz = /bits/ 64 <1110000000>;
127154a419bf49 Asahi Lina        2022-11-25   383  			opp-microvolt = <820000>;
127154a419bf49 Asahi Lina        2022-11-25   384  			opp-microwatt = <15071000>;
127154a419bf49 Asahi Lina        2022-11-25   385  		};
127154a419bf49 Asahi Lina        2022-11-25   386  		opp06 {
127154a419bf49 Asahi Lina        2022-11-25   387  			opp-hz = /bits/ 64 <1236000000>;
127154a419bf49 Asahi Lina        2022-11-25   388  			opp-microvolt = <875000>;
127154a419bf49 Asahi Lina        2022-11-25   389  			opp-microwatt = <18891000>;
127154a419bf49 Asahi Lina        2022-11-25   390  		};
127154a419bf49 Asahi Lina        2022-11-25   391  		opp07 {
127154a419bf49 Asahi Lina        2022-11-25   392  			opp-hz = /bits/ 64 <1338000000>;
127154a419bf49 Asahi Lina        2022-11-25   393  			opp-microvolt = <915000>;
127154a419bf49 Asahi Lina        2022-11-25   394  			opp-microwatt = <21960000>;
127154a419bf49 Asahi Lina        2022-11-25   395  		};
127154a419bf49 Asahi Lina        2022-11-25   396  		opp08 {
127154a419bf49 Asahi Lina        2022-11-25   397  			opp-hz = /bits/ 64 <1398000000>;
127154a419bf49 Asahi Lina        2022-11-25   398  			opp-microvolt = <950000>;
127154a419bf49 Asahi Lina        2022-11-25   399  			opp-microwatt = <22800000>;
127154a419bf49 Asahi Lina        2022-11-25   400  		};
127154a419bf49 Asahi Lina        2022-11-25   401  	};
127154a419bf49 Asahi Lina        2022-11-25   402  
2d5ce3fbef3242 Hector Martin     2023-03-07   403  	timer {
2d5ce3fbef3242 Hector Martin     2023-03-07   404  		compatible = "arm,armv8-timer";
2d5ce3fbef3242 Hector Martin     2023-03-07   405  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   406  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
2d5ce3fbef3242 Hector Martin     2023-03-07   407  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   408  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   409  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   410  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   411  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   412  
2d5ce3fbef3242 Hector Martin     2023-03-07   413  	pmu-e {
2d5ce3fbef3242 Hector Martin     2023-03-07   414  		compatible = "apple,blizzard-pmu";
2d5ce3fbef3242 Hector Martin     2023-03-07   415  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   416  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   417  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   418  
2d5ce3fbef3242 Hector Martin     2023-03-07   419  	pmu-p {
2d5ce3fbef3242 Hector Martin     2023-03-07   420  		compatible = "apple,avalanche-pmu";
2d5ce3fbef3242 Hector Martin     2023-03-07   421  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   422  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   423  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   424  
2d5ce3fbef3242 Hector Martin     2023-03-07   425  	clkref: clock-ref {
2d5ce3fbef3242 Hector Martin     2023-03-07   426  		compatible = "fixed-clock";
2d5ce3fbef3242 Hector Martin     2023-03-07   427  		#clock-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   428  		clock-frequency = <24000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   429  		clock-output-names = "clkref";
2d5ce3fbef3242 Hector Martin     2023-03-07   430  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   431  
2d5ce3fbef3242 Hector Martin     2023-03-07   432  	/*
2d5ce3fbef3242 Hector Martin     2023-03-07   433  	 * This is a fabulated representation of the input clock
2d5ce3fbef3242 Hector Martin     2023-03-07   434  	 * to NCO since we don't know the true clock tree.
2d5ce3fbef3242 Hector Martin     2023-03-07   435  	 */
2d5ce3fbef3242 Hector Martin     2023-03-07   436  	nco_clkref: clock-ref-nco {
2d5ce3fbef3242 Hector Martin     2023-03-07   437  		compatible = "fixed-clock";
2d5ce3fbef3242 Hector Martin     2023-03-07   438  		#clock-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   439  		clock-output-names = "nco_ref";
2d5ce3fbef3242 Hector Martin     2023-03-07   440  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   441  
1a9848aa69affe Janne Grunau      2022-11-20   442  	/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
1a9848aa69affe Janne Grunau      2022-11-20   443  	clk_disp0: clock-disp0 {
1a9848aa69affe Janne Grunau      2022-11-20   444  		compatible = "fixed-clock";
1a9848aa69affe Janne Grunau      2022-11-20   445  		#clock-cells = <0>;
1a9848aa69affe Janne Grunau      2022-11-20   446  		clock-frequency = <533333328>;
1a9848aa69affe Janne Grunau      2022-11-20   447  		clock-output-names = "clk_disp0";
1a9848aa69affe Janne Grunau      2022-11-20   448  	};
1a9848aa69affe Janne Grunau      2022-11-20   449  
c4e367f4fb68e1 Janne Grunau      2022-12-03   450  	/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
c4e367f4fb68e1 Janne Grunau      2022-12-03   451  	clk_dispext0: clock-dispext0 {
c4e367f4fb68e1 Janne Grunau      2022-12-03   452  		compatible = "fixed-clock";
c4e367f4fb68e1 Janne Grunau      2022-12-03   453  		#clock-cells = <0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03   454  		clock-frequency = <0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03   455  		clock-output-names = "clk_dispext0";
c4e367f4fb68e1 Janne Grunau      2022-12-03   456  	};
c4e367f4fb68e1 Janne Grunau      2022-12-03   457  
127154a419bf49 Asahi Lina        2022-11-25   458  	reserved-memory {
127154a419bf49 Asahi Lina        2022-11-25   459  		#address-cells = <2>;
127154a419bf49 Asahi Lina        2022-11-25   460  		#size-cells = <2>;
127154a419bf49 Asahi Lina        2022-11-25   461  		ranges;
127154a419bf49 Asahi Lina        2022-11-25   462  
127154a419bf49 Asahi Lina        2022-11-25   463  		uat_handoff: uat-handoff {
127154a419bf49 Asahi Lina        2022-11-25   464  			reg = <0x0 0 0 0>;
127154a419bf49 Asahi Lina        2022-11-25   465  			no-map;
127154a419bf49 Asahi Lina        2022-11-25   466  		};
127154a419bf49 Asahi Lina        2022-11-25   467  
127154a419bf49 Asahi Lina        2022-11-25   468  		uat_pagetables: uat-pagetables {
127154a419bf49 Asahi Lina        2022-11-25   469  			reg = <0x0 0 0 0>;
127154a419bf49 Asahi Lina        2022-11-25   470  			no-map;
127154a419bf49 Asahi Lina        2022-11-25   471  		};
127154a419bf49 Asahi Lina        2022-11-25   472  
127154a419bf49 Asahi Lina        2022-11-25   473  		uat_ttbs: uat-ttbs {
127154a419bf49 Asahi Lina        2022-11-25   474  			reg = <0x0 0 0 0>;
127154a419bf49 Asahi Lina        2022-11-25   475  			no-map;
127154a419bf49 Asahi Lina        2022-11-25   476  		};
127154a419bf49 Asahi Lina        2022-11-25   477  	};
127154a419bf49 Asahi Lina        2022-11-25   478  
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   479  	clk_200m: clock-200m {
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   480  		compatible = "fixed-clock";
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   481  		#clock-cells = <0>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   482  		clock-frequency = <200000000>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   483  		clock-output-names = "clk_200m";
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   484  	};
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   485  
2d5ce3fbef3242 Hector Martin     2023-03-07   486  	soc {
2d5ce3fbef3242 Hector Martin     2023-03-07   487  		compatible = "simple-bus";
2d5ce3fbef3242 Hector Martin     2023-03-07   488  		#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   489  		#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   490  
2d5ce3fbef3242 Hector Martin     2023-03-07   491  		ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07   492  		nonposted-mmio;
961fca5c061ebd Hector Martin     2023-04-11   493  		/* Required to get >32-bit DMA via DARTs */
961fca5c061ebd Hector Martin     2023-04-11   494  		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   495  
127154a419bf49 Asahi Lina        2022-11-25   496  		gpu: gpu@206400000 {
127154a419bf49 Asahi Lina        2022-11-25   497  			compatible = "apple,agx-t8112", "apple,agx-g14g";
127154a419bf49 Asahi Lina        2022-11-25   498  			reg = <0x2 0x6400000 0 0x40000>,
127154a419bf49 Asahi Lina        2022-11-25   499  				<0x2 0x4000000 0 0x1000000>;
127154a419bf49 Asahi Lina        2022-11-25   500  			reg-names = "asc", "sgx";
127154a419bf49 Asahi Lina        2022-11-25   501  			interrupt-parent = <&aic>;
127154a419bf49 Asahi Lina        2022-11-25   502  			interrupts = <AIC_IRQ 697 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   503  				<AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   504  				<AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   505  				<AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   506  				<AIC_IRQ 713 IRQ_TYPE_LEVEL_HIGH>;
127154a419bf49 Asahi Lina        2022-11-25   507  			mboxes = <&agx_mbox>;
127154a419bf49 Asahi Lina        2022-11-25   508  			power-domains = <&ps_gfx>;
127154a419bf49 Asahi Lina        2022-11-25   509  			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
127154a419bf49 Asahi Lina        2022-11-25   510  			memory-region-names = "ttbs", "pagetables", "handoff";
127154a419bf49 Asahi Lina        2022-11-25   511  
127154a419bf49 Asahi Lina        2022-11-25   512  			apple,firmware-version = <12 4 0>;
127154a419bf49 Asahi Lina        2022-11-25   513  			apple,firmware-compat = <12 4 0>;
127154a419bf49 Asahi Lina        2022-11-25   514  
127154a419bf49 Asahi Lina        2022-11-25   515  			operating-points-v2 = <&gpu_opp>;
127154a419bf49 Asahi Lina        2022-11-25   516  			apple,perf-base-pstate = <1>;
127154a419bf49 Asahi Lina        2022-11-25   517  			apple,min-sram-microvolt = <780000>;
127154a419bf49 Asahi Lina        2022-11-25   518  			apple,avg-power-filter-tc-ms = <300>;
127154a419bf49 Asahi Lina        2022-11-25   519  			apple,avg-power-ki-only = <9.375>;
127154a419bf49 Asahi Lina        2022-11-25   520  			apple,avg-power-kp = <3.22>;
127154a419bf49 Asahi Lina        2022-11-25   521  			apple,avg-power-min-duty-cycle = <40>;
127154a419bf49 Asahi Lina        2022-11-25   522  			apple,avg-power-target-filter-tc = <1>;
127154a419bf49 Asahi Lina        2022-11-25   523  			apple,fast-die0-integral-gain = <200.0>;
127154a419bf49 Asahi Lina        2022-11-25   524  			apple,fast-die0-proportional-gain = <5.0>;
127154a419bf49 Asahi Lina        2022-11-25   525  			apple,perf-boost-ce-step = <50>;
127154a419bf49 Asahi Lina        2022-11-25   526  			apple,perf-boost-min-util = <90>;
127154a419bf49 Asahi Lina        2022-11-25   527  			apple,perf-filter-drop-threshold = <0>;
127154a419bf49 Asahi Lina        2022-11-25   528  			apple,perf-filter-time-constant = <5>;
127154a419bf49 Asahi Lina        2022-11-25   529  			apple,perf-filter-time-constant2 = <200>;
127154a419bf49 Asahi Lina        2022-11-25   530  			apple,perf-integral-gain = <5.94>;
127154a419bf49 Asahi Lina        2022-11-25   531  			apple,perf-integral-gain2 = <5.94>;
127154a419bf49 Asahi Lina        2022-11-25   532  			apple,perf-integral-min-clamp = <0>;
127154a419bf49 Asahi Lina        2022-11-25   533  			apple,perf-proportional-gain = <14.85>;
127154a419bf49 Asahi Lina        2022-11-25   534  			apple,perf-proportional-gain2 = <14.85>;
127154a419bf49 Asahi Lina        2022-11-25   535  			apple,perf-tgt-utilization = <85>;
127154a419bf49 Asahi Lina        2022-11-25   536  			apple,power-sample-period = <8>;
127154a419bf49 Asahi Lina        2022-11-25   537  			apple,ppm-filter-time-constant-ms = <34>;
127154a419bf49 Asahi Lina        2022-11-25   538  			apple,ppm-ki = <205.0>;
127154a419bf49 Asahi Lina        2022-11-25   539  			apple,ppm-kp = <0.75>;
127154a419bf49 Asahi Lina        2022-11-25   540  			apple,pwr-min-duty-cycle = <40>;
127154a419bf49 Asahi Lina        2022-11-25   541  			apple,core-leak-coef = <1920.0>;
127154a419bf49 Asahi Lina        2022-11-25   542  			apple,sram-leak-coef = <74.0>;
127154a419bf49 Asahi Lina        2022-11-25   543  		};
127154a419bf49 Asahi Lina        2022-11-25   544  
127154a419bf49 Asahi Lina        2022-11-25   545  		agx_mbox: mbox@206408000 {
127154a419bf49 Asahi Lina        2022-11-25   546  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
127154a419bf49 Asahi Lina        2022-11-25   547  			reg = <0x2 0x6408000 0x0 0x4000>;
127154a419bf49 Asahi Lina        2022-11-25   548  			interrupt-parent = <&aic>;
127154a419bf49 Asahi Lina        2022-11-25   549  			interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   550  				<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   551  				<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
127154a419bf49 Asahi Lina        2022-11-25   552  				<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
127154a419bf49 Asahi Lina        2022-11-25   553  			interrupt-names = "send-empty", "send-not-empty",
127154a419bf49 Asahi Lina        2022-11-25   554  				"recv-empty", "recv-not-empty";
127154a419bf49 Asahi Lina        2022-11-25   555  			#mbox-cells = <0>;
127154a419bf49 Asahi Lina        2022-11-25   556  		};
127154a419bf49 Asahi Lina        2022-11-25   557  
2d5ce3fbef3242 Hector Martin     2023-03-07   558  		cpufreq_e: cpufreq@210e20000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   559  			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
2d5ce3fbef3242 Hector Martin     2023-03-07   560  			reg = <0x2 0x10e20000 0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   561  			#performance-domain-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   562  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   563  
2d5ce3fbef3242 Hector Martin     2023-03-07   564  		cpufreq_p: cpufreq@211e20000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   565  			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
2d5ce3fbef3242 Hector Martin     2023-03-07   566  			reg = <0x2 0x11e20000 0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   567  			#performance-domain-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   568  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   569  
beb3714e742b25 Janne Grunau      2023-04-15   570  		display_dfr: display-pipe@228200000 {
beb3714e742b25 Janne Grunau      2023-04-15   571  			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
beb3714e742b25 Janne Grunau      2023-04-15   572  			reg-names = "be", "fe", "mipi";
beb3714e742b25 Janne Grunau      2023-04-15   573  			reg = <0x2 0x28200000 0x0 0xc000>,
beb3714e742b25 Janne Grunau      2023-04-15   574  				<0x2 0x28400000 0x0 0x4000>,
beb3714e742b25 Janne Grunau      2023-04-15   575  				<0x2 0x28600000 0x0 0x100000>;
beb3714e742b25 Janne Grunau      2023-04-15   576  			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
beb3714e742b25 Janne Grunau      2023-04-15   577  			interrupt-parent = <&aic>;
beb3714e742b25 Janne Grunau      2023-04-15   578  			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
beb3714e742b25 Janne Grunau      2023-04-15   579  				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
beb3714e742b25 Janne Grunau      2023-04-15   580  			interrupt-names = "be", "fe";
beb3714e742b25 Janne Grunau      2023-04-15   581  			status = "disabled";
beb3714e742b25 Janne Grunau      2023-04-15   582  			iommus = <&displaydfr_dart 0>;
beb3714e742b25 Janne Grunau      2023-04-15   583  		};
beb3714e742b25 Janne Grunau      2023-04-15   584  
beb3714e742b25 Janne Grunau      2023-04-15   585  		displaydfr_dart: iommu@228304000 {
beb3714e742b25 Janne Grunau      2023-04-15   586  			compatible = "apple,t8110-dart";
beb3714e742b25 Janne Grunau      2023-04-15   587  			reg = <0x2 0x28304000 0x0 0x4000>;
beb3714e742b25 Janne Grunau      2023-04-15   588  			interrupt-parent = <&aic>;
beb3714e742b25 Janne Grunau      2023-04-15   589  			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
beb3714e742b25 Janne Grunau      2023-04-15   590  			#iommu-cells = <1>;
beb3714e742b25 Janne Grunau      2023-04-15   591  			power-domains = <&ps_dispdfr_fe>;
beb3714e742b25 Janne Grunau      2023-04-15   592  			status = "disabled";
beb3714e742b25 Janne Grunau      2023-04-15   593  		};
beb3714e742b25 Janne Grunau      2023-04-15   594  
21413c9fd5afe2 Hector Martin     2023-09-08   595  		isp_dart0: iommu@22c4a8000 {
21413c9fd5afe2 Hector Martin     2023-09-08   596  			compatible = "apple,t8110-dart";
21413c9fd5afe2 Hector Martin     2023-09-08   597  			reg = <0x2 0x2c4a8000 0x0 0x4000>;
21413c9fd5afe2 Hector Martin     2023-09-08   598  			#iommu-cells = <1>;
21413c9fd5afe2 Hector Martin     2023-09-08   599  			interrupt-parent = <&aic>;
21413c9fd5afe2 Hector Martin     2023-09-08   600  			interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
21413c9fd5afe2 Hector Martin     2023-09-08   601  			power-domains = <&ps_isp_sys>;
21413c9fd5afe2 Hector Martin     2023-09-08   602  			status = "disabled";
21413c9fd5afe2 Hector Martin     2023-09-08   603  		};
21413c9fd5afe2 Hector Martin     2023-09-08   604  
21413c9fd5afe2 Hector Martin     2023-09-08   605  		isp_dart1: iommu@22c4b4000 {
21413c9fd5afe2 Hector Martin     2023-09-08   606  			compatible = "apple,t8110-dart";
21413c9fd5afe2 Hector Martin     2023-09-08   607  			reg = <0x2 0x2c4b4000 0x0 0x4000>;
21413c9fd5afe2 Hector Martin     2023-09-08   608  			#iommu-cells = <1>;
21413c9fd5afe2 Hector Martin     2023-09-08   609  			interrupt-parent = <&aic>;
21413c9fd5afe2 Hector Martin     2023-09-08   610  			interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
21413c9fd5afe2 Hector Martin     2023-09-08   611  			power-domains = <&ps_isp_sys>;
21413c9fd5afe2 Hector Martin     2023-09-08   612  			status = "disabled";
21413c9fd5afe2 Hector Martin     2023-09-08   613  		};
21413c9fd5afe2 Hector Martin     2023-09-08   614  
21413c9fd5afe2 Hector Martin     2023-09-08   615  		isp_dart2: iommu@22c4bc000 {
21413c9fd5afe2 Hector Martin     2023-09-08   616  			compatible = "apple,t8110-dart";
21413c9fd5afe2 Hector Martin     2023-09-08   617  			reg = <0x2 0x2c4bc000 0x0 0x4000>;
21413c9fd5afe2 Hector Martin     2023-09-08   618  			#iommu-cells = <1>;
21413c9fd5afe2 Hector Martin     2023-09-08   619  			interrupt-parent = <&aic>;
21413c9fd5afe2 Hector Martin     2023-09-08   620  			interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
21413c9fd5afe2 Hector Martin     2023-09-08   621  			power-domains = <&ps_isp_sys>;
21413c9fd5afe2 Hector Martin     2023-09-08   622  			status = "disabled";
21413c9fd5afe2 Hector Martin     2023-09-08   623  		};
21413c9fd5afe2 Hector Martin     2023-09-08   624  
21413c9fd5afe2 Hector Martin     2023-09-08   625  		isp: isp@22a000000 {
21413c9fd5afe2 Hector Martin     2023-09-08   626  			compatible = "apple,t8112-isp", "apple,isp";
21413c9fd5afe2 Hector Martin     2023-09-08   627  			iommus = <&isp_dart0 0>, <&isp_dart1 0>, <&isp_dart2 0>;
21413c9fd5afe2 Hector Martin     2023-09-08   628  			reg-names = "coproc", "mbox", "gpio", "mbox2";
21413c9fd5afe2 Hector Martin     2023-09-08   629  			reg = <0x2 0x2a000000 0x0 0x2000000>,
21413c9fd5afe2 Hector Martin     2023-09-08   630  				<0x2 0x2c4c4000 0x0 0x100>,
21413c9fd5afe2 Hector Martin     2023-09-08   631  				<0x2 0x2c4c41b0 0x0 0x100>,
21413c9fd5afe2 Hector Martin     2023-09-08   632  				<0x2 0x2c4c4430 0x0 0x100>;
21413c9fd5afe2 Hector Martin     2023-09-08   633  			interrupt-parent = <&aic>;
21413c9fd5afe2 Hector Martin     2023-09-08   634  			interrupts = <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
21413c9fd5afe2 Hector Martin     2023-09-08   635  			power-domains = <&ps_isp_sys>, <&ps_isp_set0>,
21413c9fd5afe2 Hector Martin     2023-09-08   636  				<&ps_isp_set1>, <&ps_isp_set2>, <&ps_isp_fe>,
21413c9fd5afe2 Hector Martin     2023-09-08   637  				<&ps_isp_set4>, <&ps_isp_set5>, <&ps_isp_set6>,
21413c9fd5afe2 Hector Martin     2023-09-08   638  				<&ps_isp_set7>, <&ps_isp_set8>, <&ps_isp_set9>,
21413c9fd5afe2 Hector Martin     2023-09-08   639  				<&ps_isp_set10>, <&ps_isp_set11>,
21413c9fd5afe2 Hector Martin     2023-09-08   640  				<&ps_isp_set12>;
21413c9fd5afe2 Hector Martin     2023-09-08   641  
21413c9fd5afe2 Hector Martin     2023-09-08   642  			apple,dart-vm-size = <0x0 0xa0000000>;
21413c9fd5afe2 Hector Martin     2023-09-08   643  			status = "disabled";
21413c9fd5afe2 Hector Martin     2023-09-08   644  		};
21413c9fd5afe2 Hector Martin     2023-09-08   645  
1a9848aa69affe Janne Grunau      2022-11-20   646  		disp0_dart: iommu@231304000 {
1a9848aa69affe Janne Grunau      2022-11-20   647  			compatible = "apple,t8112-dart", "apple,t8110-dart";
1a9848aa69affe Janne Grunau      2022-11-20   648  			reg = <0x2 0x31304000 0x0 0x4000>;
1a9848aa69affe Janne Grunau      2022-11-20   649  			#iommu-cells = <1>;
1a9848aa69affe Janne Grunau      2022-11-20   650  			interrupt-parent = <&aic>;
1a9848aa69affe Janne Grunau      2022-11-20   651  			interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
3117ffc0491c8f Hector Martin     2022-12-13   652  			power-domains = <&ps_disp0_cpu0>;
d8f59ff14e7c51 Janne Grunau      2023-11-06   653  			apple,dma-range = <0x0 0x0 0xf 0xffff0000>;
1a9848aa69affe Janne Grunau      2022-11-20   654  			status = "disabled";
1a9848aa69affe Janne Grunau      2022-11-20   655  		};
1a9848aa69affe Janne Grunau      2022-11-20   656  
1a9848aa69affe Janne Grunau      2022-11-20   657  		dcp_dart: iommu@23130c000 {
1a9848aa69affe Janne Grunau      2022-11-20   658  			compatible = "apple,t8112-dart", "apple,t8110-dart";
1a9848aa69affe Janne Grunau      2022-11-20   659  			reg = <0x2 0x3130c000 0x0 0x4000>;
1a9848aa69affe Janne Grunau      2022-11-20   660  			#iommu-cells = <1>;
1a9848aa69affe Janne Grunau      2022-11-20   661  			interrupt-parent = <&aic>;
1a9848aa69affe Janne Grunau      2022-11-20   662  			interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
3117ffc0491c8f Hector Martin     2022-12-13   663  			power-domains = <&ps_disp0_cpu0>;
d8f59ff14e7c51 Janne Grunau      2023-11-06   664  			apple,dma-range = <0x8 0x00000000 0x7 0xffff0000>;
1a9848aa69affe Janne Grunau      2022-11-20   665  		};
1a9848aa69affe Janne Grunau      2022-11-20   666  
1a9848aa69affe Janne Grunau      2022-11-20   667  		dcp_mbox: mbox@231c08000 {
1a9848aa69affe Janne Grunau      2022-11-20   668  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
1a9848aa69affe Janne Grunau      2022-11-20   669  			reg = <0x2 0x31c08000 0x0 0x4000>;
1a9848aa69affe Janne Grunau      2022-11-20   670  			interrupt-parent = <&aic>;
1a9848aa69affe Janne Grunau      2022-11-20   671  			interrupts = <AIC_IRQ 535 IRQ_TYPE_LEVEL_HIGH>,
1a9848aa69affe Janne Grunau      2022-11-20   672  				<AIC_IRQ 536 IRQ_TYPE_LEVEL_HIGH>,
1a9848aa69affe Janne Grunau      2022-11-20   673  				<AIC_IRQ 537 IRQ_TYPE_LEVEL_HIGH>,
1a9848aa69affe Janne Grunau      2022-11-20   674  				<AIC_IRQ 538 IRQ_TYPE_LEVEL_HIGH>;
1a9848aa69affe Janne Grunau      2022-11-20   675  			interrupt-names = "send-empty", "send-not-empty",
1a9848aa69affe Janne Grunau      2022-11-20   676  				"recv-empty", "recv-not-empty";
1a9848aa69affe Janne Grunau      2022-11-20   677  			#mbox-cells = <0>;
1a9848aa69affe Janne Grunau      2022-11-20   678  			power-domains = <&ps_disp0_cpu0>;
1a9848aa69affe Janne Grunau      2022-11-20   679  			resets = <&ps_disp0_cpu0>;
1a9848aa69affe Janne Grunau      2022-11-20   680  		};
1a9848aa69affe Janne Grunau      2022-11-20   681  
1a9848aa69affe Janne Grunau      2022-11-20   682  		dcp: dcp@231c00000 {
1a9848aa69affe Janne Grunau      2022-11-20   683  			compatible = "apple,t8112-dcp", "apple,dcp";
1a9848aa69affe Janne Grunau      2022-11-20   684  			mboxes = <&dcp_mbox>;
1a9848aa69affe Janne Grunau      2022-11-20   685  			mbox-names = "mbox";
1a9848aa69affe Janne Grunau      2022-11-20   686  			iommus = <&dcp_dart 5>;
1a9848aa69affe Janne Grunau      2022-11-20   687  
1a9848aa69affe Janne Grunau      2022-11-20   688  			/* the ADT has 2 additional regs which seems to be unused */
1a9848aa69affe Janne Grunau      2022-11-20   689  			reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
1a9848aa69affe Janne Grunau      2022-11-20   690  			reg = <0x2 0x31c00000 0x0 0x4000>,
1a9848aa69affe Janne Grunau      2022-11-20   691  				<0x2 0x30000000 0x0 0x61c000>,
1a9848aa69affe Janne Grunau      2022-11-20   692  				<0x2 0x31320000 0x0 0x4000>,
1a9848aa69affe Janne Grunau      2022-11-20   693  				<0x2 0x31344000 0x0 0x4000>,
1a9848aa69affe Janne Grunau      2022-11-20   694  				<0x2 0x31800000 0x0 0x800000>;
1a9848aa69affe Janne Grunau      2022-11-20   695  			apple,bw-scratch = <&pmgr_dcp 0 4 0x5d8>;
1a9848aa69affe Janne Grunau      2022-11-20   696  			power-domains = <&ps_disp0_cpu0>;
c6bcfe44abcf47 Janne Grunau      2023-01-09   697  			resets = <&ps_disp0_cpu0>;
1a9848aa69affe Janne Grunau      2022-11-20   698  			clocks = <&clk_disp0>;
1a9848aa69affe Janne Grunau      2022-11-20   699  			phandle = <&dcp>;
1a9848aa69affe Janne Grunau      2022-11-20   700  
1a9848aa69affe Janne Grunau      2022-11-20   701  			disp0_piodma: piodma {
1a9848aa69affe Janne Grunau      2022-11-20   702  				iommus = <&disp0_dart 4>;
1a9848aa69affe Janne Grunau      2022-11-20   703  				phandle = <&disp0_piodma>;
1a9848aa69affe Janne Grunau      2022-11-20   704  			};
525b850e8a6e81 Janne Grunau      2023-11-13   705  
525b850e8a6e81 Janne Grunau      2023-11-13   706  			ports {
525b850e8a6e81 Janne Grunau      2023-11-13   707  				#address-cells = <1>;
525b850e8a6e81 Janne Grunau      2023-11-13   708  				#size-cells = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   709  				port@0 {
525b850e8a6e81 Janne Grunau      2023-11-13   710  					reg = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   711  					dcp_audio: endpoint {
525b850e8a6e81 Janne Grunau      2023-11-13   712  						remote-endpoint = <&dpaudio0_dcp>;
525b850e8a6e81 Janne Grunau      2023-11-13   713  					};
525b850e8a6e81 Janne Grunau      2023-11-13   714  				};
525b850e8a6e81 Janne Grunau      2023-11-13   715  			};
1a9848aa69affe Janne Grunau      2022-11-20   716  		};
1a9848aa69affe Janne Grunau      2022-11-20   717  
1a9848aa69affe Janne Grunau      2022-11-20   718  		display: display-subsystem {
1a9848aa69affe Janne Grunau      2022-11-20   719  			compatible = "apple,display-subsystem";
1a9848aa69affe Janne Grunau      2022-11-20   720  			/* disp_dart0 must be 1st since it is locked */
1a9848aa69affe Janne Grunau      2022-11-20   721  			iommus = <&disp0_dart 0>;
1a9848aa69affe Janne Grunau      2022-11-20   722  			/* generate phandle explicitly for use in loader */
1a9848aa69affe Janne Grunau      2022-11-20   723  			phandle = <&display>;
1a9848aa69affe Janne Grunau      2022-11-20   724  		};
1a9848aa69affe Janne Grunau      2022-11-20   725  
2d5ce3fbef3242 Hector Martin     2023-03-07   726  		sio_dart: iommu@235004000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   727  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07   728  			reg = <0x2 0x35004000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   729  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   730  			interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   731  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   732  			power-domains = <&ps_sio_cpu>;
2d5ce3fbef3242 Hector Martin     2023-03-07   733  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   734  
2d5ce3fbef3242 Hector Martin     2023-03-07   735  		i2c0: i2c@235010000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   736  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   737  			reg = <0x2 0x35010000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   738  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   739  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   740  			interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   741  			pinctrl-0 = <&i2c0_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   742  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   743  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   744  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   745  			power-domains = <&ps_i2c0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   746  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   747  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   748  
2d5ce3fbef3242 Hector Martin     2023-03-07   749  		i2c1: i2c@235014000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   750  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   751  			reg = <0x2 0x35014000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   752  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   753  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   754  			interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   755  			pinctrl-0 = <&i2c1_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   756  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   757  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   758  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   759  			power-domains = <&ps_i2c1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   760  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   761  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   762  
2d5ce3fbef3242 Hector Martin     2023-03-07   763  		i2c2: i2c@235018000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   764  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   765  			reg = <0x2 0x35018000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   766  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   767  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   768  			interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   769  			pinctrl-0 = <&i2c2_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   770  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   771  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   772  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   773  			power-domains = <&ps_i2c2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   774  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   775  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   776  
2d5ce3fbef3242 Hector Martin     2023-03-07   777  		i2c3: i2c@23501c000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   778  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   779  			reg = <0x2 0x3501c000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   780  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   781  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   782  			interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   783  			pinctrl-0 = <&i2c3_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   784  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   785  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   786  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   787  			power-domains = <&ps_i2c3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   788  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   789  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   790  
2d5ce3fbef3242 Hector Martin     2023-03-07   791  		i2c4: i2c@235020000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   792  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   793  			reg = <0x2 0x35020000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   794  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   795  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   796  			interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   797  			pinctrl-0 = <&i2c4_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   798  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   799  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   800  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   801  			power-domains = <&ps_i2c4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   802  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   803  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   804  
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   805  		fpwm1: pwm@235044000 {
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   806  			compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   807  			reg = <0x2 0x35044000 0x0 0x4000>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   808  			power-domains = <&ps_fpwm1>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   809  			clocks = <&clkref>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   810  			#pwm-cells = <2>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   811  			status = "disabled";
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   812  		};
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   813  
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   814  		spi1: spi@235104000 {
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   815  			compatible = "apple,t8112-spi", "apple,spi";
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   816  			reg = <0x2 0x35104000 0x0 0x4000>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   817  			interrupt-parent = <&aic>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   818  			interrupts = <AIC_IRQ 749 IRQ_TYPE_LEVEL_HIGH>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   819  			clocks = <&clk_200m>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   820  			pinctrl-0 = <&spi1_pins>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   821  			pinctrl-names = "default";
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   822  			power-domains = <&ps_spi1>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   823  			#address-cells = <1>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   824  			#size-cells = <0>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   825  			status = "disabled";
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   826  		};
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29   827  
234e235d5f08e7 Janne Grunau      2023-02-02   828  		spi3: spi@23510c000 {
234e235d5f08e7 Janne Grunau      2023-02-02   829  			compatible = "apple,t8112-spi", "apple,spi";
234e235d5f08e7 Janne Grunau      2023-02-02   830  			reg = <0x2 0x3510c000 0x0 0x4000>;
234e235d5f08e7 Janne Grunau      2023-02-02   831  			interrupt-parent = <&aic>;
234e235d5f08e7 Janne Grunau      2023-02-02   832  			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
234e235d5f08e7 Janne Grunau      2023-02-02   833  			clocks = <&clkref>;
234e235d5f08e7 Janne Grunau      2023-02-02   834  			pinctrl-0 = <&spi3_pins>;
234e235d5f08e7 Janne Grunau      2023-02-02   835  			pinctrl-names = "default";
234e235d5f08e7 Janne Grunau      2023-02-02   836  			power-domains = <&ps_spi3>;
234e235d5f08e7 Janne Grunau      2023-02-02   837  			#address-cells = <1>;
234e235d5f08e7 Janne Grunau      2023-02-02   838  			#size-cells = <0>;
234e235d5f08e7 Janne Grunau      2023-02-02   839  			status = "disabled";
234e235d5f08e7 Janne Grunau      2023-02-02   840  		};
234e235d5f08e7 Janne Grunau      2023-02-02   841  
2d5ce3fbef3242 Hector Martin     2023-03-07   842  		serial0: serial@235200000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   843  			compatible = "apple,s5l-uart";
2d5ce3fbef3242 Hector Martin     2023-03-07   844  			reg = <0x2 0x35200000 0x0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   845  			reg-io-width = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   846  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   847  			interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   848  			/*
2d5ce3fbef3242 Hector Martin     2023-03-07   849  			 * TODO: figure out the clocking properly, there may
2d5ce3fbef3242 Hector Martin     2023-03-07   850  			 * be a third selectable clock.
2d5ce3fbef3242 Hector Martin     2023-03-07   851  			 */
2d5ce3fbef3242 Hector Martin     2023-03-07   852  			clocks = <&clkref>, <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   853  			clock-names = "uart", "clk_uart_baud0";
2d5ce3fbef3242 Hector Martin     2023-03-07   854  			power-domains = <&ps_uart0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   855  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   856  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   857  
2d5ce3fbef3242 Hector Martin     2023-03-07   858  		serial2: serial@235208000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   859  			compatible = "apple,s5l-uart";
2d5ce3fbef3242 Hector Martin     2023-03-07   860  			reg = <0x2 0x35208000 0x0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   861  			reg-io-width = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   862  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   863  			interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   864  			clocks = <&clkref>, <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   865  			clock-names = "uart", "clk_uart_baud0";
2d5ce3fbef3242 Hector Martin     2023-03-07   866  			power-domains = <&ps_uart2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   867  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   868  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   869  
525b850e8a6e81 Janne Grunau      2023-11-13   870  		sio_mbox: mbox@236408000 {
525b850e8a6e81 Janne Grunau      2023-11-13   871  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
525b850e8a6e81 Janne Grunau      2023-11-13   872  			reg = <0x2 0x36408000 0x0 0x4000>;
525b850e8a6e81 Janne Grunau      2023-11-13   873  			interrupt-parent = <&aic>;
525b850e8a6e81 Janne Grunau      2023-11-13   874  			interrupts = <AIC_IRQ 774 IRQ_TYPE_LEVEL_HIGH>,
525b850e8a6e81 Janne Grunau      2023-11-13   875  				<AIC_IRQ 775 IRQ_TYPE_LEVEL_HIGH>,
525b850e8a6e81 Janne Grunau      2023-11-13   876  				<AIC_IRQ 776 IRQ_TYPE_LEVEL_HIGH>,
525b850e8a6e81 Janne Grunau      2023-11-13   877  				<AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
525b850e8a6e81 Janne Grunau      2023-11-13   878  			interrupt-names = "send-empty", "send-not-empty",
525b850e8a6e81 Janne Grunau      2023-11-13   879  				"recv-empty", "recv-not-empty";
525b850e8a6e81 Janne Grunau      2023-11-13   880  			#mbox-cells = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   881  			power-domains = <&ps_sio_cpu>;
525b850e8a6e81 Janne Grunau      2023-11-13   882  		};
525b850e8a6e81 Janne Grunau      2023-11-13   883  
525b850e8a6e81 Janne Grunau      2023-11-13   884  		sio: sio@236400000 {
525b850e8a6e81 Janne Grunau      2023-11-13   885  			compatible = "apple,t8112-sio", "apple,sio";
525b850e8a6e81 Janne Grunau      2023-11-13   886  			reg = <0x2 0x36400000 0x0 0x8000>;
525b850e8a6e81 Janne Grunau      2023-11-13   887  			dma-channels = <128>;
525b850e8a6e81 Janne Grunau      2023-11-13   888  			#dma-cells = <1>;
525b850e8a6e81 Janne Grunau      2023-11-13   889  			mboxes = <&sio_mbox>;
525b850e8a6e81 Janne Grunau      2023-11-13   890  			iommus = <&sio_dart 0>;
525b850e8a6e81 Janne Grunau      2023-11-13   891  			power-domains = <&ps_sio_cpu>;
525b850e8a6e81 Janne Grunau      2023-11-13   892  			resets = <&ps_sio>; /* TODO: verify reset does something */
525b850e8a6e81 Janne Grunau      2023-11-13   893  			status = "disabled";
525b850e8a6e81 Janne Grunau      2023-11-13   894  		};
525b850e8a6e81 Janne Grunau      2023-11-13   895  
2d5ce3fbef3242 Hector Martin     2023-03-07   896  		admac: dma-controller@238200000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   897  			compatible = "apple,t8112-admac", "apple,admac";
2d5ce3fbef3242 Hector Martin     2023-03-07   898  			reg = <0x2 0x38200000 0x0 0x34000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   899  			dma-channels = <24>;
2d5ce3fbef3242 Hector Martin     2023-03-07   900  			interrupts-extended = <0>,
2d5ce3fbef3242 Hector Martin     2023-03-07   901  					      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   902  					      <0>,
2d5ce3fbef3242 Hector Martin     2023-03-07   903  					      <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   904  			#dma-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   905  			iommus = <&sio_dart 2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   906  			power-domains = <&ps_sio_adma>;
2d5ce3fbef3242 Hector Martin     2023-03-07   907  			resets = <&ps_audio_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   908  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   909  
525b850e8a6e81 Janne Grunau      2023-11-13   910  		dpaudio0: audio-controller@238330000 {
525b850e8a6e81 Janne Grunau      2023-11-13   911  			compatible = "apple,t8112-dpaudio", "apple,dpaudio";
525b850e8a6e81 Janne Grunau      2023-11-13   912  			reg = <0x2 0x38330000 0x0 0x4000>;
525b850e8a6e81 Janne Grunau      2023-11-13   913  			dmas = <&sio 0x64>;
525b850e8a6e81 Janne Grunau      2023-11-13   914  			dma-names = "tx";
525b850e8a6e81 Janne Grunau      2023-11-13   915  			power-domains = <&ps_dpa0>;
525b850e8a6e81 Janne Grunau      2023-11-13   916  			reset-domains = <&ps_dpa0>;
525b850e8a6e81 Janne Grunau      2023-11-13   917  			status = "disabled";
525b850e8a6e81 Janne Grunau      2023-11-13   918  
525b850e8a6e81 Janne Grunau      2023-11-13   919  			ports {
525b850e8a6e81 Janne Grunau      2023-11-13   920  				#address-cells = <1>;
525b850e8a6e81 Janne Grunau      2023-11-13   921  				#size-cells = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   922  				port@0 {
525b850e8a6e81 Janne Grunau      2023-11-13   923  					reg = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   924  					dpaudio0_dcp: endpoint {
525b850e8a6e81 Janne Grunau      2023-11-13   925  						remote-endpoint = <&dcp_audio>;
525b850e8a6e81 Janne Grunau      2023-11-13   926  					};
525b850e8a6e81 Janne Grunau      2023-11-13   927  				};
525b850e8a6e81 Janne Grunau      2023-11-13   928  			};
525b850e8a6e81 Janne Grunau      2023-11-13   929  		};
525b850e8a6e81 Janne Grunau      2023-11-13   930  
525b850e8a6e81 Janne Grunau      2023-11-13   931  		dpaudio1: audio-controller@238334000 {
525b850e8a6e81 Janne Grunau      2023-11-13   932  			compatible = "apple,t8112-dpaudio", "apple,dpaudio";
525b850e8a6e81 Janne Grunau      2023-11-13   933  			reg = <0x2 0x38334000 0x0 0x4000>;
525b850e8a6e81 Janne Grunau      2023-11-13   934  			dmas = <&sio 0x66>;
525b850e8a6e81 Janne Grunau      2023-11-13   935  			dma-names = "tx";
525b850e8a6e81 Janne Grunau      2023-11-13   936  			power-domains = <&ps_dpa1>;
525b850e8a6e81 Janne Grunau      2023-11-13   937  			reset-domains = <&ps_dpa1>;
525b850e8a6e81 Janne Grunau      2023-11-13   938  			status = "disabled";
525b850e8a6e81 Janne Grunau      2023-11-13   939  
525b850e8a6e81 Janne Grunau      2023-11-13   940  			ports {
525b850e8a6e81 Janne Grunau      2023-11-13   941  				#address-cells = <1>;
525b850e8a6e81 Janne Grunau      2023-11-13   942  				#size-cells = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   943  				port@0 {
525b850e8a6e81 Janne Grunau      2023-11-13   944  					reg = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13   945  					dpaudio1_dcp: endpoint {
525b850e8a6e81 Janne Grunau      2023-11-13   946  						remote-endpoint = <&dcpext_audio>;
525b850e8a6e81 Janne Grunau      2023-11-13   947  					};
525b850e8a6e81 Janne Grunau      2023-11-13   948  				};
525b850e8a6e81 Janne Grunau      2023-11-13   949  			};
525b850e8a6e81 Janne Grunau      2023-11-13   950  		};
525b850e8a6e81 Janne Grunau      2023-11-13   951  
2d5ce3fbef3242 Hector Martin     2023-03-07   952  		mca: i2s@238400000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   953  			compatible = "apple,t8112-mca", "apple,mca";
2d5ce3fbef3242 Hector Martin     2023-03-07   954  			reg = <0x2 0x38400000 0x0 0x18000>,
2d5ce3fbef3242 Hector Martin     2023-03-07   955  			      <0x2 0x38300000 0x0 0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   956  
2d5ce3fbef3242 Hector Martin     2023-03-07   957  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   958  			interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   959  				     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   960  				     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   961  				     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   962  				     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   963  				     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   964  
2d5ce3fbef3242 Hector Martin     2023-03-07   965  			resets = <&ps_audio_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   966  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07   967  				 <&nco 3>, <&nco 4>, <&nco 4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   968  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
2d5ce3fbef3242 Hector Martin     2023-03-07   969  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   970  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
2d5ce3fbef3242 Hector Martin     2023-03-07   971  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
2d5ce3fbef3242 Hector Martin     2023-03-07   972  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
2d5ce3fbef3242 Hector Martin     2023-03-07   973  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
2d5ce3fbef3242 Hector Martin     2023-03-07   974  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
2d5ce3fbef3242 Hector Martin     2023-03-07   975  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
2d5ce3fbef3242 Hector Martin     2023-03-07   976  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
2d5ce3fbef3242 Hector Martin     2023-03-07   977  				    "tx1a", "rx1a", "tx1b", "rx1b",
2d5ce3fbef3242 Hector Martin     2023-03-07   978  				    "tx2a", "rx2a", "tx2b", "rx2b",
2d5ce3fbef3242 Hector Martin     2023-03-07   979  				    "tx3a", "rx3a", "tx3b", "rx3b",
2d5ce3fbef3242 Hector Martin     2023-03-07   980  				    "tx4a", "rx4a", "tx4b", "rx4b",
2d5ce3fbef3242 Hector Martin     2023-03-07   981  				    "tx5a", "rx5a", "tx5b", "rx5b";
2d5ce3fbef3242 Hector Martin     2023-03-07   982  
2d5ce3fbef3242 Hector Martin     2023-03-07   983  			#sound-dai-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   984  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   985  
2d5ce3fbef3242 Hector Martin     2023-03-07   986  		nco: clock-controller@23b044000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   987  			compatible = "apple,t8112-nco", "apple,nco";
2d5ce3fbef3242 Hector Martin     2023-03-07   988  			reg = <0x2 0x3b044000 0x0 0x14000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   989  			clocks = <&nco_clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   990  			#clock-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   991  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   992  
2d5ce3fbef3242 Hector Martin     2023-03-07   993  		aic: interrupt-controller@23b0c0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   994  			compatible = "apple,t8112-aic", "apple,aic2";
2d5ce3fbef3242 Hector Martin     2023-03-07   995  			#interrupt-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   996  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07   997  			reg = <0x2 0x3b0c0000 0x0 0x8000>,
2d5ce3fbef3242 Hector Martin     2023-03-07   998  				<0x2 0x3b0c8000 0x0 0x4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   999  			reg-names = "core", "event";
2d5ce3fbef3242 Hector Martin     2023-03-07  1000  			power-domains = <&ps_aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1001  
2d5ce3fbef3242 Hector Martin     2023-03-07  1002  			affinities {
2d5ce3fbef3242 Hector Martin     2023-03-07  1003  				e-core-pmu-affinity {
2d5ce3fbef3242 Hector Martin     2023-03-07  1004  					apple,fiq-index = <AIC_CPU_PMU_E>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1005  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1006  				};
2d5ce3fbef3242 Hector Martin     2023-03-07  1007  
2d5ce3fbef3242 Hector Martin     2023-03-07  1008  				p-core-pmu-affinity {
2d5ce3fbef3242 Hector Martin     2023-03-07  1009  					apple,fiq-index = <AIC_CPU_PMU_P>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1010  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1011  				};
2d5ce3fbef3242 Hector Martin     2023-03-07  1012  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1013  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1014  
2d5ce3fbef3242 Hector Martin     2023-03-07  1015  		pmgr: power-management@23b700000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1016  			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
2d5ce3fbef3242 Hector Martin     2023-03-07  1017  			#address-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1018  			#size-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1019  			reg = <0x2 0x3b700000 0 0x14000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1020  			/* child nodes are added in t8103-pmgr.dtsi */
2d5ce3fbef3242 Hector Martin     2023-03-07  1021  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1022  
1a9848aa69affe Janne Grunau      2022-11-20  1023  		pmgr_dcp: power-management@23b3d0000 {
1a9848aa69affe Janne Grunau      2022-11-20  1024  			reg = <0x2 0x3b3d0000 0x0 0x4000>;
1a9848aa69affe Janne Grunau      2022-11-20  1025  			reg-names = "dcp-bw-scratch";
1a9848aa69affe Janne Grunau      2022-11-20  1026  			#apple,bw-scratch-cells = <3>;
1a9848aa69affe Janne Grunau      2022-11-20  1027  		};
1a9848aa69affe Janne Grunau      2022-11-20  1028  
2d5ce3fbef3242 Hector Martin     2023-03-07  1029  		pinctrl_ap: pinctrl@23c100000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1030  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1031  			reg = <0x2 0x3c100000 0x0 0x100000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1032  			power-domains = <&ps_gpio>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1033  
2d5ce3fbef3242 Hector Martin     2023-03-07  1034  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1035  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1036  			gpio-ranges = <&pinctrl_ap 0 0 213>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1037  			apple,npins = <213>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1038  
2d5ce3fbef3242 Hector Martin     2023-03-07  1039  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1040  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1041  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1042  			interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1043  				     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1044  				     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1045  				     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1046  				     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1047  				     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1048  				     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1049  
2d5ce3fbef3242 Hector Martin     2023-03-07  1050  			i2c0_pins: i2c0-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1051  				pinmux = <APPLE_PINMUX(111, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1052  					 <APPLE_PINMUX(110, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1053  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1054  
2d5ce3fbef3242 Hector Martin     2023-03-07  1055  			i2c1_pins: i2c1-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1056  				pinmux = <APPLE_PINMUX(113, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1057  					 <APPLE_PINMUX(112, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1058  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1059  
2d5ce3fbef3242 Hector Martin     2023-03-07  1060  			i2c2_pins: i2c2-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1061  				pinmux = <APPLE_PINMUX(87, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1062  					 <APPLE_PINMUX(86, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1063  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1064  
2d5ce3fbef3242 Hector Martin     2023-03-07  1065  			i2c3_pins: i2c3-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1066  				pinmux = <APPLE_PINMUX(54, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1067  					 <APPLE_PINMUX(53, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1068  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1069  
2d5ce3fbef3242 Hector Martin     2023-03-07  1070  			i2c4_pins: i2c4-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1071  				pinmux = <APPLE_PINMUX(131, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1072  					 <APPLE_PINMUX(130, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1073  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1074  
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1075  			spi1_pins: spi1-pins {
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1076  				pinmux = <APPLE_PINMUX(46, 1)>,
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1077  					<APPLE_PINMUX(47, 1)>,
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1078  					<APPLE_PINMUX(48, 1)>,
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1079  					<APPLE_PINMUX(49, 1)>;
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1080  			};
cac666ed5f7ce7 Sasha Finkelstein 2022-10-29  1081  
2d5ce3fbef3242 Hector Martin     2023-03-07  1082  			spi3_pins: spi3-pins {
234e235d5f08e7 Janne Grunau      2023-02-02  1083  				pinmux = <APPLE_PINMUX(93, 1)>,
234e235d5f08e7 Janne Grunau      2023-02-02  1084  					<APPLE_PINMUX(94, 1)>,
234e235d5f08e7 Janne Grunau      2023-02-02  1085  					<APPLE_PINMUX(95, 1)>,
234e235d5f08e7 Janne Grunau      2023-02-02  1086  					<APPLE_PINMUX(96, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1087  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1088  
2d5ce3fbef3242 Hector Martin     2023-03-07  1089  			pcie_pins: pcie-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1090  				pinmux = <APPLE_PINMUX(162, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1091  					 <APPLE_PINMUX(163, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1092  					 <APPLE_PINMUX(164, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1093  				// TODO: 1 more CLKREQs
2d5ce3fbef3242 Hector Martin     2023-03-07  1094  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1095  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1096  
7295ff2c799ca6 Janne Grunau      2023-10-28  1097  		dptxphy: phy@23c500000 {
7295ff2c799ca6 Janne Grunau      2023-10-28  1098  			compatible = "apple,t8112-dptx-phy", "apple,dptx-phy";
7295ff2c799ca6 Janne Grunau      2023-10-28  1099  			reg = <0x2 0x3c500000 0x0 0x4000>,
7295ff2c799ca6 Janne Grunau      2023-10-28  1100  				<0x2 0x3c540000 0x0 0xc000>;
7295ff2c799ca6 Janne Grunau      2023-10-28  1101  			reg-names = "core", "dptx";
95faea5a692cfa Janne Grunau      2024-03-24  1102  			power-domains = <&ps_dptx_ext_phy>;
7295ff2c799ca6 Janne Grunau      2023-10-28  1103  			#phy-cells = <0>;
7295ff2c799ca6 Janne Grunau      2023-10-28  1104  			#reset-cells = <0>;
7295ff2c799ca6 Janne Grunau      2023-10-28  1105  			status = "disabled"; /* only used on j473 */
7295ff2c799ca6 Janne Grunau      2023-10-28  1106                 };
7295ff2c799ca6 Janne Grunau      2023-10-28  1107  
85037f19134405 Janne Grunau      2024-06-12  1108  		nub_spmi: spmi@23d714000 {
198ea3ef9ff667 Hector Martin     2022-02-15  1109  			compatible = "apple,t8112-spmi", "apple,spmi";
198ea3ef9ff667 Hector Martin     2022-02-15  1110  			reg = <0x2 0x3d714000 0x0 0x100>;
198ea3ef9ff667 Hector Martin     2022-02-15  1111  			#address-cells = <2>;
198ea3ef9ff667 Hector Martin     2022-02-15  1112  			#size-cells = <0>;
198ea3ef9ff667 Hector Martin     2022-02-15  1113  			interrupt-parent = <&aic>;
198ea3ef9ff667 Hector Martin     2022-02-15  1114  			interrupts = <AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>,
198ea3ef9ff667 Hector Martin     2022-02-15  1115  				<AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>;
198ea3ef9ff667 Hector Martin     2022-02-15  1116  
198ea3ef9ff667 Hector Martin     2022-02-15  1117  			pmu1: pmu@e {
198ea3ef9ff667 Hector Martin     2022-02-15  1118  				compatible = "apple,stowe-pmu", "apple,spmi-pmu";
198ea3ef9ff667 Hector Martin     2022-02-15  1119  				reg = <0xe SPMI_USID>;
198ea3ef9ff667 Hector Martin     2022-02-15  1120  				#address-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1121  				#size-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1122  
198ea3ef9ff667 Hector Martin     2022-02-15  1123  				rtc_nvmem@f800 {
198ea3ef9ff667 Hector Martin     2022-02-15  1124  					compatible = "apple,spmi-pmu-nvmem";
198ea3ef9ff667 Hector Martin     2022-02-15  1125  					reg = <0xf800 0x300>;
198ea3ef9ff667 Hector Martin     2022-02-15  1126  					#address-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1127  					#size-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1128  
198ea3ef9ff667 Hector Martin     2022-02-15  1129  					pm_setting: pm-setting@1 {
198ea3ef9ff667 Hector Martin     2022-02-15  1130  						reg = <0x1 0x1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1131  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1132  
198ea3ef9ff667 Hector Martin     2022-02-15  1133  					rtc_offset: rtc-offset@100 {
198ea3ef9ff667 Hector Martin     2022-02-15  1134  						reg = <0x100 0x6>;
198ea3ef9ff667 Hector Martin     2022-02-15  1135  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1136  				};
198ea3ef9ff667 Hector Martin     2022-02-15  1137  
198ea3ef9ff667 Hector Martin     2022-02-15  1138  				legacy_nvmem@f700 {
198ea3ef9ff667 Hector Martin     2022-02-15  1139  					compatible = "apple,spmi-pmu-nvmem";
198ea3ef9ff667 Hector Martin     2022-02-15  1140  					reg = <0xf700 0x20>;
198ea3ef9ff667 Hector Martin     2022-02-15  1141  					#address-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1142  					#size-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1143  
198ea3ef9ff667 Hector Martin     2022-02-15  1144  					boot_stage: boot-stage@1 {
198ea3ef9ff667 Hector Martin     2022-02-15  1145  						reg = <0x1 0x1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1146  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1147  
198ea3ef9ff667 Hector Martin     2022-02-15 @1148  					boot_error_count: boot-error-count@2 {
198ea3ef9ff667 Hector Martin     2022-02-15  1149  						reg = <0x2 0x1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1150  						bits = <0 4>;
198ea3ef9ff667 Hector Martin     2022-02-15  1151  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1152  
198ea3ef9ff667 Hector Martin     2022-02-15  1153  					panic_count: panic-count@2 {
198ea3ef9ff667 Hector Martin     2022-02-15  1154  						reg = <0x2 0x1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1155  						bits = <4 4>;
198ea3ef9ff667 Hector Martin     2022-02-15  1156  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1157  
198ea3ef9ff667 Hector Martin     2022-02-15  1158  					boot_error_stage: boot-error-stage@3 {
198ea3ef9ff667 Hector Martin     2022-02-15  1159  						reg = <0x3 0x1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1160  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1161  
198ea3ef9ff667 Hector Martin     2022-02-15  1162  					shutdown_flag: shutdown-flag@f {
198ea3ef9ff667 Hector Martin     2022-02-15  1163  						reg = <0xf 0x1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1164  						bits = <3 1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1165  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1166  				};
198ea3ef9ff667 Hector Martin     2022-02-15  1167  
198ea3ef9ff667 Hector Martin     2022-02-15  1168  				scrpad_nvmem@8000 {
198ea3ef9ff667 Hector Martin     2022-02-15  1169  					compatible = "apple,spmi-pmu-nvmem";
198ea3ef9ff667 Hector Martin     2022-02-15  1170  					reg = <0x8000 0x2800>;
198ea3ef9ff667 Hector Martin     2022-02-15  1171  					#address-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1172  					#size-cells = <1>;
198ea3ef9ff667 Hector Martin     2022-02-15  1173  
198ea3ef9ff667 Hector Martin     2022-02-15  1174  					fault_shadow: fault-shadow@67b {
198ea3ef9ff667 Hector Martin     2022-02-15  1175  						reg = <0x67b 0x10>;
198ea3ef9ff667 Hector Martin     2022-02-15  1176  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1177  
198ea3ef9ff667 Hector Martin     2022-02-15  1178  					socd: socd@b00 {
198ea3ef9ff667 Hector Martin     2022-02-15  1179  						reg = <0xb00 0x400>;
198ea3ef9ff667 Hector Martin     2022-02-15  1180  					};
198ea3ef9ff667 Hector Martin     2022-02-15  1181  				};
198ea3ef9ff667 Hector Martin     2022-02-15  1182  
198ea3ef9ff667 Hector Martin     2022-02-15  1183  			};
198ea3ef9ff667 Hector Martin     2022-02-15  1184  		};
198ea3ef9ff667 Hector Martin     2022-02-15  1185  
2d5ce3fbef3242 Hector Martin     2023-03-07  1186  		pinctrl_nub: pinctrl@23d1f0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1187  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1188  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1189  			power-domains = <&ps_nub_gpio>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1190  
2d5ce3fbef3242 Hector Martin     2023-03-07  1191  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1192  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1193  			gpio-ranges = <&pinctrl_nub 0 0 24>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1194  			apple,npins = <24>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1195  
2d5ce3fbef3242 Hector Martin     2023-03-07  1196  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1197  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1198  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1199  			interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1200  				     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1201  				     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1202  				     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1203  				     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1204  				     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1205  				     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1206  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1207  
2d5ce3fbef3242 Hector Martin     2023-03-07  1208  		pmgr_mini: power-management@23d280000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1209  			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
2d5ce3fbef3242 Hector Martin     2023-03-07  1210  			#address-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1211  			#size-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1212  			reg = <0x2 0x3d280000 0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1213  			/* child nodes are added in t8103-pmgr.dtsi */
2d5ce3fbef3242 Hector Martin     2023-03-07  1214  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1215  
2d5ce3fbef3242 Hector Martin     2023-03-07  1216  		wdt: watchdog@23d2b0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1217  			compatible = "apple,t8112-wdt", "apple,wdt";
2d5ce3fbef3242 Hector Martin     2023-03-07  1218  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1219  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1220  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1221  			interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1222  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1223  
c470ce26a52cc9 Janne Grunau      2022-11-15  1224  		efuse@23d2c8000 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1225  			compatible = "apple,t8112-efuses", "apple,efuses";
c470ce26a52cc9 Janne Grunau      2022-11-15  1226  			reg = <0x2 0x3d2c8000 0x0 0x1000>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1227  			#address-cells = <1>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1228  			#size-cells = <1>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1229  
c470ce26a52cc9 Janne Grunau      2022-11-15  1230  			atcphy0_auspll_rodco_bias_adjust: efuse@480,20 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1231  				reg = <0x480 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1232  				bits = <20 3>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1233  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1234  
c470ce26a52cc9 Janne Grunau      2022-11-15  1235  			atcphy0_auspll_rodco_encap: efuse@480,23 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1236  				reg = <0x480 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1237  				bits = <23 2>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1238  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1239  
c470ce26a52cc9 Janne Grunau      2022-11-15  1240  			atcphy0_auspll_dtc_vreg_adjust: efuse@480,25 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1241  				reg = <0x480 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1242  				bits = <25 3>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1243  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1244  
c470ce26a52cc9 Janne Grunau      2022-11-15  1245  			atcphy0_auspll_fracn_dll_start_capcode: efuse@480,28 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1246  				reg = <0x480 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1247  				bits = <28 2>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1248  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1249  
c470ce26a52cc9 Janne Grunau      2022-11-15  1250  			atcphy0_aus_cmn_shm_vreg_trim: efuse@480,30 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1251  				reg = <0x480 8>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1252  				bits = <30 5>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1253  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1254  
c470ce26a52cc9 Janne Grunau      2022-11-15  1255  			atcphy0_cio3pll_dco_coarsebin0: efuse@484,3 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1256  				reg = <0x484 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1257  				bits = <3 6>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1258  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1259  
c470ce26a52cc9 Janne Grunau      2022-11-15  1260  			atcphy0_cio3pll_dco_coarsebin1: efuse@484,9 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1261  				reg = <0x484 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1262  				bits = <9 6>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1263  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1264  
c470ce26a52cc9 Janne Grunau      2022-11-15  1265  			atcphy0_cio3pll_dll_start_capcode: efuse@484,15 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1266  				reg = <0x484 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1267  				bits = <15 2>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1268  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1269  
c470ce26a52cc9 Janne Grunau      2022-11-15  1270  			atcphy0_cio3pll_dtc_vreg_adjust: efuse@484,17 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1271  				reg = <0x484 0x4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1272  				bits = <17 3>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1273  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1274  
c470ce26a52cc9 Janne Grunau      2022-11-15  1275  			atcphy1_auspll_rodco_bias_adjust: efuse@484,30 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1276  				reg = <0x484 8>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1277  				bits = <30 3>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1278  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1279  
c470ce26a52cc9 Janne Grunau      2022-11-15  1280  			atcphy1_auspll_rodco_encap: efuse@488,1 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1281  				reg = <0x488 8>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1282  				bits = <1 2>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1283  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1284  
c470ce26a52cc9 Janne Grunau      2022-11-15  1285  			atcphy1_auspll_dtc_vreg_adjust: efuse@488,3 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1286  				reg = <0x488 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1287  				bits = <3 3>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1288  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1289  
c470ce26a52cc9 Janne Grunau      2022-11-15  1290  			atcphy1_auspll_fracn_dll_start_capcode: efuse@488,6 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1291  				reg = <0x488 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1292  				bits = <6 2>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1293  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1294  
c470ce26a52cc9 Janne Grunau      2022-11-15  1295  			atcphy1_aus_cmn_shm_vreg_trim: efuse@488,8 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1296  				reg = <0x488 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1297  				bits = <8 5>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1298  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1299  
c470ce26a52cc9 Janne Grunau      2022-11-15  1300  			atcphy1_cio3pll_dco_coarsebin0: efuse@488,13 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1301  				reg = <0x488 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1302  				bits = <13 6>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1303  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1304  
c470ce26a52cc9 Janne Grunau      2022-11-15  1305  			atcphy1_cio3pll_dco_coarsebin1: efuse@488,19 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1306  				reg = <0x488 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1307  				bits = <19 6>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1308  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1309  
c470ce26a52cc9 Janne Grunau      2022-11-15  1310  			atcphy1_cio3pll_dll_start_capcode: efuse@488,25 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1311  				reg = <0x488 4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1312  				bits = <25 2>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1313  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1314  
c470ce26a52cc9 Janne Grunau      2022-11-15  1315  			atcphy1_cio3pll_dtc_vreg_adjust: efuse@488,27 {
c470ce26a52cc9 Janne Grunau      2022-11-15  1316  				reg = <0x488 0x4>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1317  				bits = <27 3>;
c470ce26a52cc9 Janne Grunau      2022-11-15  1318  			};
c470ce26a52cc9 Janne Grunau      2022-11-15  1319  		};
c470ce26a52cc9 Janne Grunau      2022-11-15  1320  
cace51fa825b20 Hector Martin     2022-02-04  1321  		smc_mbox: mbox@23e408000 {
cace51fa825b20 Hector Martin     2022-02-04  1322  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
cace51fa825b20 Hector Martin     2022-02-04  1323  			reg = <0x2 0x3e408000 0x0 0x4000>;
cace51fa825b20 Hector Martin     2022-02-04  1324  			interrupt-parent = <&aic>;
cace51fa825b20 Hector Martin     2022-02-04  1325  			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
cace51fa825b20 Hector Martin     2022-02-04  1326  				<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
cace51fa825b20 Hector Martin     2022-02-04  1327  				<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
cace51fa825b20 Hector Martin     2022-02-04  1328  				<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
cace51fa825b20 Hector Martin     2022-02-04  1329  			interrupt-names = "send-empty", "send-not-empty",
cace51fa825b20 Hector Martin     2022-02-04  1330  				"recv-empty", "recv-not-empty";
cace51fa825b20 Hector Martin     2022-02-04  1331  			#mbox-cells = <0>;
cace51fa825b20 Hector Martin     2022-02-04  1332  		};
cace51fa825b20 Hector Martin     2022-02-04  1333  
cace51fa825b20 Hector Martin     2022-02-04  1334  		smc: smc@23e400000 {
cace51fa825b20 Hector Martin     2022-02-04  1335  			compatible = "apple,t8112-smc", "apple,smc";
cace51fa825b20 Hector Martin     2022-02-04  1336  			reg = <0x2 0x3e400000 0x0 0x4000>,
cace51fa825b20 Hector Martin     2022-02-04  1337  				<0x2 0x3fe00000 0x0 0x100000>;
cace51fa825b20 Hector Martin     2022-02-04  1338  			reg-names = "smc", "sram";
cace51fa825b20 Hector Martin     2022-02-04  1339  			mboxes = <&smc_mbox>;
cace51fa825b20 Hector Martin     2022-02-04  1340  
cace51fa825b20 Hector Martin     2022-02-04  1341  			smc_gpio: gpio {
cace51fa825b20 Hector Martin     2022-02-04  1342  				gpio-controller;
cace51fa825b20 Hector Martin     2022-02-04  1343  				#gpio-cells = <2>;
cace51fa825b20 Hector Martin     2022-02-04  1344  			};
cace51fa825b20 Hector Martin     2022-02-04  1345  
cace51fa825b20 Hector Martin     2022-02-04  1346  			smc_rtc: rtc {
cace51fa825b20 Hector Martin     2022-02-04  1347  				nvmem-cells = <&rtc_offset>;
cace51fa825b20 Hector Martin     2022-02-04  1348  				nvmem-cell-names = "rtc_offset";
cace51fa825b20 Hector Martin     2022-02-04  1349  			};
cace51fa825b20 Hector Martin     2022-02-04  1350  
cace51fa825b20 Hector Martin     2022-02-04  1351  			smc_reboot: reboot {
cace51fa825b20 Hector Martin     2022-02-04  1352  				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
cace51fa825b20 Hector Martin     2022-02-04  1353  					<&boot_error_count>, <&panic_count>, <&pm_setting>;
cace51fa825b20 Hector Martin     2022-02-04  1354  				nvmem-cell-names = "shutdown_flag", "boot_stage",
cace51fa825b20 Hector Martin     2022-02-04  1355  					"boot_error_count", "panic_count", "pm_setting";
cace51fa825b20 Hector Martin     2022-02-04  1356  			};
cace51fa825b20 Hector Martin     2022-02-04  1357  		};
cace51fa825b20 Hector Martin     2022-02-04  1358  
2d5ce3fbef3242 Hector Martin     2023-03-07  1359  		pinctrl_smc: pinctrl@23e820000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1360  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1361  			reg = <0x2 0x3e820000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1362  
2d5ce3fbef3242 Hector Martin     2023-03-07  1363  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1364  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1365  			gpio-ranges = <&pinctrl_smc 0 0 18>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1366  			apple,npins = <18>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1367  
2d5ce3fbef3242 Hector Martin     2023-03-07  1368  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1369  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1370  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1371  			interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1372  				     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1373  				     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1374  				     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1375  				     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1376  				     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1377  				     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1378  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1379  
2d5ce3fbef3242 Hector Martin     2023-03-07  1380  		pinctrl_aop: pinctrl@24a820000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1381  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1382  			reg = <0x2 0x4a820000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1383  
2d5ce3fbef3242 Hector Martin     2023-03-07  1384  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1385  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1386  			gpio-ranges = <&pinctrl_aop 0 0 54>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1387  			apple,npins = <54>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1388  
2d5ce3fbef3242 Hector Martin     2023-03-07  1389  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1390  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1391  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1392  			interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1393  				     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1394  				     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1395  				     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1396  				     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1397  				     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1398  				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1399  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1400  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1401  		mtp: mtp@24e400000 {
df8e1b8cd933e3 Janne Grunau      2023-02-02  1402  			compatible = "apple,t8112-mtp", "apple,t8112-rtk-helper-asc4", "apple,mtp", "apple,rtk-helper-asc4";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1403  			reg = <0x2 0x4e400000 0x0 0x4000>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1404  				<0x2 0x4ec00000 0x0 0x100000>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1405  			reg-names = "asc", "sram";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1406  			mboxes = <&mtp_mbox>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1407  			iommus = <&mtp_dart 1>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1408  			#helper-cells = <0>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1409  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1410  			status = "disabled";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1411  		};
df8e1b8cd933e3 Janne Grunau      2023-02-02  1412  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1413  		mtp_mbox: mbox@24e408000 {
df8e1b8cd933e3 Janne Grunau      2023-02-02  1414  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1415  			reg = <0x2 0x4e408000 0x0 0x4000>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1416  			interrupt-parent = <&aic>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1417  			interrupts = <AIC_IRQ 864 IRQ_TYPE_LEVEL_HIGH>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1418  				<AIC_IRQ 865 IRQ_TYPE_LEVEL_HIGH>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1419  				<AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1420  				<AIC_IRQ 867 IRQ_TYPE_LEVEL_HIGH>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1421  			interrupt-names = "send-empty", "send-not-empty",
df8e1b8cd933e3 Janne Grunau      2023-02-02  1422  				"recv-empty", "recv-not-empty";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1423  			#mbox-cells = <0>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1424  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1425  			status = "disabled";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1426  		};
df8e1b8cd933e3 Janne Grunau      2023-02-02  1427  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1428  		mtp_dart: iommu@24e808000 {
df8e1b8cd933e3 Janne Grunau      2023-02-02  1429  			compatible = "apple,t8112-dart", "apple,t8110-dart";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1430  			reg = <0x2 0x4e808000 0x0 0x4000>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1431  			interrupt-parent = <&aic>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1432  			interrupts = <AIC_IRQ 848 IRQ_TYPE_LEVEL_HIGH>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1433  			#iommu-cells = <1>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1434  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1435  			status = "disabled";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1436  		};
df8e1b8cd933e3 Janne Grunau      2023-02-02  1437  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1438  		mtp_dockchannel: fifo@24eb14000 {
df8e1b8cd933e3 Janne Grunau      2023-02-02  1439  			compatible = "apple,t8112-dockchannel", "apple,dockchannel";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1440  			reg = <0x2 0x4eb14000 0x0 0x4000>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1441  			reg-names = "irq";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1442  			interrupt-parent = <&aic>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1443  			interrupts = <AIC_IRQ 850 IRQ_TYPE_LEVEL_HIGH>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1444  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1445  			ranges = <0 0x2 0x4eb28000 0x20000>;
25b478bb2d180d Hector Martin     2023-04-10  1446  			nonposted-mmio;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1447  			#address-cells = <1>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1448  			#size-cells = <1>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1449  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1450  			interrupt-controller;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1451  			#interrupt-cells = <2>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1452  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1453  			status = "disabled";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1454  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1455  			mtp_hid: input@8000 {
df8e1b8cd933e3 Janne Grunau      2023-02-02  1456  				compatible = "apple,dockchannel-hid";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1457  				reg = <0x8000 0x4000>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1458  					<0xc000 0x4000>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1459  					<0x0000 0x4000>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1460  					<0x4000 0x4000>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1461  				reg-names = "config", "data",
df8e1b8cd933e3 Janne Grunau      2023-02-02  1462  					"rmt-config", "rmt-data";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1463  				iommus = <&mtp_dart 1>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1464  				interrupt-parent = <&mtp_dockchannel>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1465  				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
df8e1b8cd933e3 Janne Grunau      2023-02-02  1466  					<3 IRQ_TYPE_LEVEL_HIGH>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1467  				interrupt-names = "tx", "rx";
df8e1b8cd933e3 Janne Grunau      2023-02-02  1468  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1469  				apple,fifo-size = <0x800>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1470  				apple,helper-cpu = <&mtp>;
df8e1b8cd933e3 Janne Grunau      2023-02-02  1471  			};
df8e1b8cd933e3 Janne Grunau      2023-02-02  1472  
df8e1b8cd933e3 Janne Grunau      2023-02-02  1473  		};
df8e1b8cd933e3 Janne Grunau      2023-02-02  1474  
c4e367f4fb68e1 Janne Grunau      2022-12-03  1475  		dispext0_dart: iommu@271304000 {
c4e367f4fb68e1 Janne Grunau      2022-12-03  1476  			compatible = "apple,t8112-dart", "apple,t8110-dart";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1477  			reg = <0x2 0x71304000 0x0 0x4000>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1478  			#iommu-cells = <1>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1479  			apple,dma-range = <0x0 0x0 0xf 0xffff0000>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1480  			interrupt-parent = <&aic>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1481  			interrupts = <AIC_IRQ 593 IRQ_TYPE_LEVEL_HIGH>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1482  			power-domains = <&ps_dispext_cpu0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1483  			status = "disabled";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1484  		};
c4e367f4fb68e1 Janne Grunau      2022-12-03  1485  
c4e367f4fb68e1 Janne Grunau      2022-12-03  1486  		dcpext_dart: iommu@27130c000 {
c4e367f4fb68e1 Janne Grunau      2022-12-03  1487  			compatible = "apple,t8112-dart", "apple,t8110-dart";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1488  			reg = <0x2 0x7130c000 0x0 0x4000>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1489  			#iommu-cells = <1>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1490  			apple,dma-range = <0x8 0x0 0x7 0xffff0000>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1491  			interrupt-parent = <&aic>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1492  			interrupts = <AIC_IRQ 593 IRQ_TYPE_LEVEL_HIGH>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1493  			power-domains = <&ps_dispext_cpu0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1494  			status = "disabled";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1495  		};
c4e367f4fb68e1 Janne Grunau      2022-12-03  1496  
c4e367f4fb68e1 Janne Grunau      2022-12-03  1497  		dcpext_mbox: mbox@271c08000 {
c4e367f4fb68e1 Janne Grunau      2022-12-03  1498  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1499  			reg = <0x2 0x71c08000 0x0 0x4000>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1500  			interrupt-parent = <&aic>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1501  			interrupts = <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1502  			<AIC_IRQ 579 IRQ_TYPE_LEVEL_HIGH>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1503  			<AIC_IRQ 580 IRQ_TYPE_LEVEL_HIGH>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1504  			<AIC_IRQ 581 IRQ_TYPE_LEVEL_HIGH>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1505  			interrupt-names = "send-empty", "send-not-empty",
c4e367f4fb68e1 Janne Grunau      2022-12-03  1506  			"recv-empty", "recv-not-empty";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1507  			#mbox-cells = <0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1508  			power-domains = <&ps_dispext_cpu0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1509  			resets = <&ps_dispext_cpu0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1510  			status = "disabled";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1511  		};
c4e367f4fb68e1 Janne Grunau      2022-12-03  1512  
c4e367f4fb68e1 Janne Grunau      2022-12-03  1513  		dcpext: dcp@271c00000 {
c4e367f4fb68e1 Janne Grunau      2022-12-03  1514  			compatible = "apple,t8112-dcpext", "apple,dcpext";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1515  			mboxes = <&dcpext_mbox>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1516  			mbox-names = "mbox";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1517  			iommus = <&dcpext_dart 5>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1518  			phandle = <&dcpext>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1519  
c4e367f4fb68e1 Janne Grunau      2022-12-03  1520  			/* the ADT has 2 additional regs which seems to be unused */
c4e367f4fb68e1 Janne Grunau      2022-12-03  1521  			reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1522  			reg = <0x2 0x71c00000 0x0 0x4000>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1523  			      <0x2 0x70000000 0x0 0x61C000>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1524  			      <0x2 0x71320000 0x0 0x4000>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1525  			      <0x2 0x71344000 0x0 0x4000>,
c4e367f4fb68e1 Janne Grunau      2022-12-03  1526  			      <0x2 0x71800000 0x0 0x800000>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1527  			apple,bw-scratch = <&pmgr_dcp 0 4 0x5e0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1528  			power-domains = <&ps_dispext_cpu0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1529  			resets = <&ps_dispext_cpu0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1530  			clocks = <&clk_dispext0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1531  			apple,asc-dram-mask = <0x0 0x0>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1532  			apple,dcp-index = <1>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1533  			status = "disabled";
c4e367f4fb68e1 Janne Grunau      2022-12-03  1534  
c4e367f4fb68e1 Janne Grunau      2022-12-03  1535  			dispext0_piodma: piodma {
c4e367f4fb68e1 Janne Grunau      2022-12-03  1536  				iommus = <&dispext0_dart 4>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1537  				phandle = <&dispext0_piodma>;
c4e367f4fb68e1 Janne Grunau      2022-12-03  1538  			};
525b850e8a6e81 Janne Grunau      2023-11-13  1539  
525b850e8a6e81 Janne Grunau      2023-11-13  1540  			ports {
525b850e8a6e81 Janne Grunau      2023-11-13  1541  				#address-cells = <1>;
525b850e8a6e81 Janne Grunau      2023-11-13  1542  				#size-cells = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13  1543  				port@0 {
525b850e8a6e81 Janne Grunau      2023-11-13  1544  					reg = <0>;
525b850e8a6e81 Janne Grunau      2023-11-13  1545  					dcpext_audio: endpoint {
525b850e8a6e81 Janne Grunau      2023-11-13  1546  						remote-endpoint = <&dpaudio1_dcp>;
525b850e8a6e81 Janne Grunau      2023-11-13  1547  					};
525b850e8a6e81 Janne Grunau      2023-11-13  1548  				};
525b850e8a6e81 Janne Grunau      2023-11-13  1549  			};
c4e367f4fb68e1 Janne Grunau      2022-12-03  1550  		};
c4e367f4fb68e1 Janne Grunau      2022-12-03  1551  
2d5ce3fbef3242 Hector Martin     2023-03-07  1552  		ans_mbox: mbox@277408000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1553  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
2d5ce3fbef3242 Hector Martin     2023-03-07  1554  			reg = <0x2 0x77408000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1555  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1556  			interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1557  				<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1558  				<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1559  				<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1560  			interrupt-names = "send-empty", "send-not-empty",
2d5ce3fbef3242 Hector Martin     2023-03-07  1561  				"recv-empty", "recv-not-empty";
2d5ce3fbef3242 Hector Martin     2023-03-07  1562  			#mbox-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1563  			power-domains = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1564  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1565  
2d5ce3fbef3242 Hector Martin     2023-03-07  1566  		sart: sart@27bc50000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1567  			compatible = "apple,t8112-sart", "apple,t6000-sart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1568  			reg = <0x2 0x7bc50000 0x0 0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1569  			power-domains = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1570  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1571  
2d5ce3fbef3242 Hector Martin     2023-03-07  1572  		nvme@27bcc0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1573  			compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
2d5ce3fbef3242 Hector Martin     2023-03-07  1574  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1575  				<0x2 0x77400000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1576  			reg-names = "nvme", "ans";
2d5ce3fbef3242 Hector Martin     2023-03-07  1577  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1578  			interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1579  			mboxes = <&ans_mbox>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1580  			apple,sart = <&sart>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1581  			power-domains = <&ps_ans>, <&ps_apcie_st>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1582  			power-domain-names = "ans", "apcie0";
2d5ce3fbef3242 Hector Martin     2023-03-07  1583  			resets = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1584  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1585  
dfeac2b68912ef Janne Grunau      2023-02-02  1586  		dwc3_0: usb@382280000 {
dfeac2b68912ef Janne Grunau      2023-02-02  1587  			compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
dfeac2b68912ef Janne Grunau      2023-02-02  1588  			reg = <0x3 0x82280000 0x0 0x100000>;
dfeac2b68912ef Janne Grunau      2023-02-02  1589  			interrupt-parent = <&aic>;
dfeac2b68912ef Janne Grunau      2023-02-02  1590  			interrupts = <AIC_IRQ 1031 IRQ_TYPE_LEVEL_HIGH>;
dfeac2b68912ef Janne Grunau      2023-02-02  1591  			dr_mode = "otg";
dfeac2b68912ef Janne Grunau      2023-02-02  1592  			usb-role-switch;
dfeac2b68912ef Janne Grunau      2023-02-02  1593  			role-switch-default-mode = "host";
dfeac2b68912ef Janne Grunau      2023-02-02  1594  			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
dfeac2b68912ef Janne Grunau      2023-02-02  1595  			power-domains = <&ps_atc0_usb>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1596  			resets = <&atcphy0>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1597  			phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1598  			phy-names = "usb2-phy", "usb3-phy";
dfeac2b68912ef Janne Grunau      2023-02-02  1599  		};
dfeac2b68912ef Janne Grunau      2023-02-02  1600  
dfeac2b68912ef Janne Grunau      2023-02-02  1601  		dwc3_0_dart_0: iommu@382f00000 {
dfeac2b68912ef Janne Grunau      2023-02-02  1602  			compatible = "apple,t8112-dart", "apple,t8110-dart";
dfeac2b68912ef Janne Grunau      2023-02-02  1603  			reg = <0x3 0x82f00000 0x0 0x4000>;
dfeac2b68912ef Janne Grunau      2023-02-02  1604  			interrupt-parent = <&aic>;
dfeac2b68912ef Janne Grunau      2023-02-02  1605  			interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
dfeac2b68912ef Janne Grunau      2023-02-02  1606  			#iommu-cells = <1>;
dfeac2b68912ef Janne Grunau      2023-02-02  1607  			power-domains = <&ps_atc0_usb>;
dfeac2b68912ef Janne Grunau      2023-02-02  1608  		};
dfeac2b68912ef Janne Grunau      2023-02-02  1609  
dfeac2b68912ef Janne Grunau      2023-02-02  1610  		dwc3_0_dart_1: iommu@382f80000 {
dfeac2b68912ef Janne Grunau      2023-02-02  1611  			compatible = "apple,t8112-dart", "apple,t8110-dart";
dfeac2b68912ef Janne Grunau      2023-02-02  1612  			reg = <0x3 0x82f80000 0x0 0x4000>;
dfeac2b68912ef Janne Grunau      2023-02-02  1613  			interrupt-parent = <&aic>;
dfeac2b68912ef Janne Grunau      2023-02-02  1614  			interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
dfeac2b68912ef Janne Grunau      2023-02-02  1615  			#iommu-cells = <1>;
dfeac2b68912ef Janne Grunau      2023-02-02  1616  			power-domains = <&ps_atc0_usb>;
dfeac2b68912ef Janne Grunau      2023-02-02  1617  		};
dfeac2b68912ef Janne Grunau      2023-02-02  1618  
691ab4c34d55d1 Janne Grunau      2022-11-15  1619  		atcphy0: phy@383000000 {
691ab4c34d55d1 Janne Grunau      2022-11-15  1620  			compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
691ab4c34d55d1 Janne Grunau      2022-11-15  1621  			reg = <0x3 0x83000000 0x0 0x4c000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1622  				<0x3 0x83050000 0x0 0x8000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1623  				<0x3 0x80000000 0x0 0x4000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1624  				<0x3 0x82a90000 0x0 0x4000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1625  				<0x3 0x82a84000 0x0 0x4000>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1626  			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
691ab4c34d55d1 Janne Grunau      2022-11-15  1627  				"pipehandler";
691ab4c34d55d1 Janne Grunau      2022-11-15  1628  
691ab4c34d55d1 Janne Grunau      2022-11-15  1629  			#phy-cells = <1>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1630  			#reset-cells = <0>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1631  
691ab4c34d55d1 Janne Grunau      2022-11-15  1632  			nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1633  				<&atcphy0_auspll_rodco_encap>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1634  				<&atcphy0_auspll_rodco_bias_adjust>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1635  				<&atcphy0_auspll_fracn_dll_start_capcode>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1636  				<&atcphy0_auspll_dtc_vreg_adjust>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1637  				<&atcphy0_cio3pll_dco_coarsebin0>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1638  				<&atcphy0_cio3pll_dco_coarsebin1>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1639  				<&atcphy0_cio3pll_dll_start_capcode>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1640  				<&atcphy0_cio3pll_dtc_vreg_adjust>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1641  			nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
691ab4c34d55d1 Janne Grunau      2022-11-15  1642  				"auspll_rodco_encap",
691ab4c34d55d1 Janne Grunau      2022-11-15  1643  				"auspll_rodco_bias_adjust",
691ab4c34d55d1 Janne Grunau      2022-11-15  1644  				"auspll_fracn_dll_start_capcode",
691ab4c34d55d1 Janne Grunau      2022-11-15  1645  				"auspll_dtc_vreg_adjust",
691ab4c34d55d1 Janne Grunau      2022-11-15  1646  				"cio3pll_dco_coarsebin0",
691ab4c34d55d1 Janne Grunau      2022-11-15  1647  				"cio3pll_dco_coarsebin1",
691ab4c34d55d1 Janne Grunau      2022-11-15  1648  				"cio3pll_dll_start_capcode",
691ab4c34d55d1 Janne Grunau      2022-11-15  1649  				"cio3pll_dtc_vreg_adjust";
691ab4c34d55d1 Janne Grunau      2022-11-15  1650  
691ab4c34d55d1 Janne Grunau      2022-11-15  1651  			orientation-switch;
691ab4c34d55d1 Janne Grunau      2022-11-15  1652  			mode-switch;
691ab4c34d55d1 Janne Grunau      2022-11-15  1653  			svid = <0xff01>, <0x8087>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1654  			power-domains = <&ps_atc0_usb>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1655  		};
691ab4c34d55d1 Janne Grunau      2022-11-15  1656  
dfeac2b68912ef Janne Grunau      2023-02-02  1657  		dwc3_1: usb@502280000 {
dfeac2b68912ef Janne Grunau      2023-02-02  1658  			compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
dfeac2b68912ef Janne Grunau      2023-02-02  1659  			reg = <0x5 0x02280000 0x0 0x100000>;
dfeac2b68912ef Janne Grunau      2023-02-02  1660  			interrupt-parent = <&aic>;
dfeac2b68912ef Janne Grunau      2023-02-02  1661  			interrupts = <AIC_IRQ 1112 IRQ_TYPE_LEVEL_HIGH>;
dfeac2b68912ef Janne Grunau      2023-02-02  1662  			dr_mode = "otg";
dfeac2b68912ef Janne Grunau      2023-02-02  1663  			usb-role-switch;
dfeac2b68912ef Janne Grunau      2023-02-02  1664  			role-switch-default-mode = "host";
dfeac2b68912ef Janne Grunau      2023-02-02  1665  			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
dfeac2b68912ef Janne Grunau      2023-02-02  1666  			power-domains = <&ps_atc1_usb>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1667  			resets = <&atcphy1>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1668  			phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1669  			phy-names = "usb2-phy", "usb3-phy";
dfeac2b68912ef Janne Grunau      2023-02-02  1670  		};
dfeac2b68912ef Janne Grunau      2023-02-02  1671  
dfeac2b68912ef Janne Grunau      2023-02-02  1672  		dwc3_1_dart_0: iommu@502f00000 {
dfeac2b68912ef Janne Grunau      2023-02-02  1673  			compatible = "apple,t8112-dart", "apple,t8110-dart";
dfeac2b68912ef Janne Grunau      2023-02-02  1674  			reg = <0x5 0x02f00000 0x0 0x4000>;
dfeac2b68912ef Janne Grunau      2023-02-02  1675  			interrupt-parent = <&aic>;
dfeac2b68912ef Janne Grunau      2023-02-02  1676  			interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
dfeac2b68912ef Janne Grunau      2023-02-02  1677  			#iommu-cells = <1>;
dfeac2b68912ef Janne Grunau      2023-02-02  1678  			power-domains = <&ps_atc1_usb>;
dfeac2b68912ef Janne Grunau      2023-02-02  1679  		};
dfeac2b68912ef Janne Grunau      2023-02-02  1680  
dfeac2b68912ef Janne Grunau      2023-02-02  1681  		dwc3_1_dart_1: iommu@502f80000 {
dfeac2b68912ef Janne Grunau      2023-02-02  1682  			compatible = "apple,t8112-dart", "apple,t8110-dart";
dfeac2b68912ef Janne Grunau      2023-02-02  1683  			reg = <0x5 0x02f80000 0x0 0x4000>;
dfeac2b68912ef Janne Grunau      2023-02-02  1684  			interrupt-parent = <&aic>;
dfeac2b68912ef Janne Grunau      2023-02-02  1685  			interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
dfeac2b68912ef Janne Grunau      2023-02-02  1686  			#iommu-cells = <1>;
dfeac2b68912ef Janne Grunau      2023-02-02  1687  			power-domains = <&ps_atc1_usb>;
dfeac2b68912ef Janne Grunau      2023-02-02  1688  		};
dfeac2b68912ef Janne Grunau      2023-02-02  1689  
691ab4c34d55d1 Janne Grunau      2022-11-15  1690  		atcphy1: phy@503000000 {
691ab4c34d55d1 Janne Grunau      2022-11-15  1691  			compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
691ab4c34d55d1 Janne Grunau      2022-11-15  1692  			reg = <0x5 0x03000000 0x0 0x4c000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1693  				<0x5 0x03050000 0x0 0x8000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1694  				<0x5 0x0 0x0 0x4000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1695  				<0x5 0x02a90000 0x0 0x4000>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1696  				<0x5 0x02a84000 0x0 0x4000>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1697  			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
691ab4c34d55d1 Janne Grunau      2022-11-15  1698  				"pipehandler";
691ab4c34d55d1 Janne Grunau      2022-11-15  1699  
691ab4c34d55d1 Janne Grunau      2022-11-15  1700  			nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1701  				<&atcphy1_auspll_rodco_encap>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1702  				<&atcphy1_auspll_rodco_bias_adjust>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1703  				<&atcphy1_auspll_fracn_dll_start_capcode>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1704  				<&atcphy1_auspll_dtc_vreg_adjust>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1705  				<&atcphy1_cio3pll_dco_coarsebin0>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1706  				<&atcphy1_cio3pll_dco_coarsebin1>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1707  				<&atcphy1_cio3pll_dll_start_capcode>,
691ab4c34d55d1 Janne Grunau      2022-11-15  1708  				<&atcphy1_cio3pll_dtc_vreg_adjust>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1709  			nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
691ab4c34d55d1 Janne Grunau      2022-11-15  1710  				"auspll_rodco_encap",
691ab4c34d55d1 Janne Grunau      2022-11-15  1711  				"auspll_rodco_bias_adjust",
691ab4c34d55d1 Janne Grunau      2022-11-15  1712  				"auspll_fracn_dll_start_capcode",
691ab4c34d55d1 Janne Grunau      2022-11-15  1713  				"auspll_dtc_vreg_adjust",
691ab4c34d55d1 Janne Grunau      2022-11-15  1714  				"cio3pll_dco_coarsebin0",
691ab4c34d55d1 Janne Grunau      2022-11-15  1715  				"cio3pll_dco_coarsebin1",
691ab4c34d55d1 Janne Grunau      2022-11-15  1716  				"cio3pll_dll_start_capcode",
691ab4c34d55d1 Janne Grunau      2022-11-15  1717  				"cio3pll_dtc_vreg_adjust";
691ab4c34d55d1 Janne Grunau      2022-11-15  1718  
691ab4c34d55d1 Janne Grunau      2022-11-15  1719  			#phy-cells = <1>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1720  			#reset-cells = <0>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1721  
691ab4c34d55d1 Janne Grunau      2022-11-15  1722  			orientation-switch;
691ab4c34d55d1 Janne Grunau      2022-11-15  1723  			mode-switch;
691ab4c34d55d1 Janne Grunau      2022-11-15  1724  			svid = <0xff01>, <0x8087>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1725  			power-domains = <&ps_atc1_usb>;
691ab4c34d55d1 Janne Grunau      2022-11-15  1726  		};
691ab4c34d55d1 Janne Grunau      2022-11-15  1727  
2d5ce3fbef3242 Hector Martin     2023-03-07  1728  		pcie0_dart: iommu@681008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1729  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1730  			reg = <0x6 0x81008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1731  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1732  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1733  			interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1734  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1735  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1736  
2d5ce3fbef3242 Hector Martin     2023-03-07  1737  		pcie1_dart: iommu@682008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1738  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1739  			reg = <0x6 0x82008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1740  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1741  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1742  			interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1743  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1744  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1745  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1746  
2d5ce3fbef3242 Hector Martin     2023-03-07  1747  		pcie2_dart: iommu@683008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1748  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1749  			reg = <0x6 0x83008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1750  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1751  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1752  			interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1753  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1754  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1755  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1756  
2d5ce3fbef3242 Hector Martin     2023-03-07  1757  		pcie3_dart: iommu@684008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1758  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1759  			reg = <0x6 0x84008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1760  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1761  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1762  			interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1763  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1764  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1765  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1766  
2d5ce3fbef3242 Hector Martin     2023-03-07  1767  		pcie0: pcie@690000000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1768  			compatible = "apple,t8112-pcie", "apple,pcie";
2d5ce3fbef3242 Hector Martin     2023-03-07  1769  			device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1770  
2d5ce3fbef3242 Hector Martin     2023-03-07  1771  			reg = <0x6 0x90000000 0x0 0x1000000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1772  			      <0x6 0x80000000 0x0 0x100000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1773  			      <0x6 0x81000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1774  			      <0x6 0x82000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1775  			      <0x6 0x83000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1776  			      <0x6 0x84000000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1777  			reg-names = "config", "rc", "port0", "port1", "port2", "port3";
2d5ce3fbef3242 Hector Martin     2023-03-07  1778  
2d5ce3fbef3242 Hector Martin     2023-03-07  1779  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1780  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1781  				     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1782  				     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1783  				     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1784  
2d5ce3fbef3242 Hector Martin     2023-03-07  1785  			msi-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1786  			msi-parent = <&pcie0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1787  			msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1788  
2d5ce3fbef3242 Hector Martin     2023-03-07  1789  			iommu-map = <0x100 &pcie0_dart 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1790  				    <0x200 &pcie1_dart 1 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1791  				    <0x300 &pcie2_dart 2 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1792  				    <0x400 &pcie3_dart 3 1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1793  			iommu-map-mask = <0xff00>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1794  
2d5ce3fbef3242 Hector Martin     2023-03-07  1795  			bus-range = <0 4>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1796  			#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1797  			#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1798  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1799  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1800  
2d5ce3fbef3242 Hector Martin     2023-03-07  1801  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1802  			pinctrl-0 = <&pcie_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1803  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07  1804  
2d5ce3fbef3242 Hector Martin     2023-03-07  1805  			port00: pci@0,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1806  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1807  				reg = <0x0 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1808  				reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1809  
2d5ce3fbef3242 Hector Martin     2023-03-07  1810  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1811  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1812  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1813  
2d5ce3fbef3242 Hector Martin     2023-03-07  1814  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1815  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1816  
2d5ce3fbef3242 Hector Martin     2023-03-07  1817  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1818  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1819  						<0 0 0 2 &port00 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1820  						<0 0 0 3 &port00 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1821  						<0 0 0 4 &port00 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1822  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1823  
2d5ce3fbef3242 Hector Martin     2023-03-07  1824  			port01: pci@1,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1825  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1826  				reg = <0x800 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1827  				reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1828  
2d5ce3fbef3242 Hector Martin     2023-03-07  1829  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1830  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1831  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1832  
2d5ce3fbef3242 Hector Martin     2023-03-07  1833  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1834  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1835  
2d5ce3fbef3242 Hector Martin     2023-03-07  1836  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1837  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1838  						<0 0 0 2 &port01 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1839  						<0 0 0 3 &port01 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1840  						<0 0 0 4 &port01 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1841  
2d5ce3fbef3242 Hector Martin     2023-03-07  1842  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1843  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1844  
2d5ce3fbef3242 Hector Martin     2023-03-07  1845  			port02: pci@2,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1846  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1847  				reg = <0x1000 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1848  				reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1849  
2d5ce3fbef3242 Hector Martin     2023-03-07  1850  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1851  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1852  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1853  
2d5ce3fbef3242 Hector Martin     2023-03-07  1854  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1855  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1856  
2d5ce3fbef3242 Hector Martin     2023-03-07  1857  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1858  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1859  						<0 0 0 2 &port02 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1860  						<0 0 0 3 &port02 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1861  						<0 0 0 4 &port02 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1862  
2d5ce3fbef3242 Hector Martin     2023-03-07  1863  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1864  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1865  
2d5ce3fbef3242 Hector Martin     2023-03-07  1866  			/* TODO: GPIO unknown */
2d5ce3fbef3242 Hector Martin     2023-03-07  1867  			port03: pci@3,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1868  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1869  				reg = <0x1800 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1870  				//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1871  
2d5ce3fbef3242 Hector Martin     2023-03-07  1872  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1873  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1874  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1875  
2d5ce3fbef3242 Hector Martin     2023-03-07  1876  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1877  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1878  
2d5ce3fbef3242 Hector Martin     2023-03-07  1879  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1880  				interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1881  						<0 0 0 2 &port03 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1882  						<0 0 0 3 &port03 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1883  						<0 0 0 4 &port03 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1884  
2d5ce3fbef3242 Hector Martin     2023-03-07  1885  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1886  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1887  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1888  	};
2d5ce3fbef3242 Hector Martin     2023-03-07  1889  };
2d5ce3fbef3242 Hector Martin     2023-03-07  1890  

:::::: The code at line 1148 was first introduced by commit
:::::: 198ea3ef9ff66707f7b10f1370204176e826526d arm64: dts: apple: t8112: Add PMU NVMEM and SMC RTC/reboot nodes

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
