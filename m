Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426D8BEA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439809; cv=none; b=FXghmCnJx4nSwomxn6s/uuXOmPOsWWs9ddXgTJ6Ryw9XrgDN4W3yePvFElPUCQz0npjCqZV2ozDHqRulc1kahhar0STMRxbKFMe8pWWyf53H8/p/i6dLVUs/DqyACzxGyAtrd7K1s6VfOkoPQ9ML2525de2T61BHfOImIgId6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439809; c=relaxed/simple;
	bh=L7X57YkCyZUV11D3ljlD+SAomjHDf1bajsBsM0MyDIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ITHfT/zeL+u/fVxRRQrzA3r5gtZ1k2STvtFhzNTmSdns0nFpb9UP3MTQfRJ+GhYX4E4LMg5ImoT0jaiWCAeB2lklwUnaYnWd2quGTphgAYY9VJJ/KCfvfDoWigLJTPEpnzr0QgGf0FvOBs9wRz6NsjzicbtISG1keq7R6Lg2HNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGLMwU/b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGLMwU/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744439801; x=1775975801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7X57YkCyZUV11D3ljlD+SAomjHDf1bajsBsM0MyDIk=;
  b=IGLMwU/bE3gqgZMir1b7Trmj5EyIcrzMc0+mw7htDIgKIiYVYKX1CFYR
   Fbxewz/2AaJgFaMydYti5aC/DVrsU1g4kDPDg69td3cuGHxFjRce34Z4N
   MYZSiGMtHSW6Qd/Rd2eW1VsdXbCC6FhJ9FsYhHZB/6u/24ZT7IgqReIeb
   kT434XqQdgBnm8NERuMn48nutOOK2G+NCgN8OreEZenNb5iFRuVqgVuIN
   O9mjjQSVhPOaNvWnolfoxcHNOidzJcgt8tmqxnRY//4jU428KQSvR0c4I
   DP548t0pPyC+PNFpDs210X8zJJ11HbWTyRC+Ekt84l7vC67AmHNuErDRy
   w==;
X-CSE-ConnectionGUID: SozP1KZWSdSGg0gI65pIJA==
X-CSE-MsgGUID: KL3BZQrmQLSRdbeZcDRULw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56169994"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="56169994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 23:36:40 -0700
X-CSE-ConnectionGUID: T3coIV2xROSRgFj1n/6btQ==
X-CSE-MsgGUID: fEjsTOchSQCLht5JPRocbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="166562063"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2025 23:36:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3UTj-000Bby-2U;
	Sat, 12 Apr 2025 06:36:35 +0000
Date: Sat, 12 Apr 2025 14:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 2959/3149]
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@0: 'operating-points'
 is a dependency of 'clock-latency'
Message-ID: <202504121401.xe9hO5hK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01c6df60d5d4ae00cd5c1648818744838bba7763
commit: 791a3fcd2345c827064ee0b81a669d75aaf4c547 [2959/3149] dt-bindings: arm/cpus: Add missing properties
config: arm64-randconfig-053-20250411 (https://download.01.org/0day-ci/archive/20250412/202504121401.xe9hO5hK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121401.xe9hO5hK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121401.xe9hO5hK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: cpu@100: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: cpu@100: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:409.11-429.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:426.12-428.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: cpu@0: Unevaluated properties are not allowed ('l2-cache-l0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: cpu@1: Unevaluated properties are not allowed ('l2-cache-l1' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: cpu@2: Unevaluated properties are not allowed ('l2-cache-l2' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: cpu@3: Unevaluated properties are not allowed ('l2-cache-l3' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:3: 'wakeup' was expected
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:409.11-429.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:426.12-428.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: cpu@0: Unevaluated properties are not allowed ('l2-cache-l0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: cpu@1: Unevaluated properties are not allowed ('l2-cache-l1' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: cpu@2: Unevaluated properties are not allowed ('l2-cache-l2' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: cpu@3: Unevaluated properties are not allowed ('l2-cache-l3' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:4: 'hpd-connected' was expected
--
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts:48.9-58.5: Warning (graph_child_address): /connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:794.26-806.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30820000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@1: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@1: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@2: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@2: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: cpu@3: 'operating-points' is a dependency of 'clock-latency'
--
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: usb-phy@7d004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: usb-phy@7d004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: usb-phy@7d004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: usb-phy@7d004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: cpu@0: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: cpu@0: Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: cpu@0: Unevaluated properties are not allowed ('qcom,freq-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: cpu@100: Unevaluated properties are not allowed ('qcom,freq-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: cpu@200: Unevaluated properties are not allowed ('qcom,freq-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: cpu@300: Unevaluated properties are not allowed ('qcom,freq-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1102.7-1109.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1117.7-1124.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1102.7-1109.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1117.7-1124.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: phy@fed90000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: cpu@0: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: cpu@400: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: cpu@600: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
