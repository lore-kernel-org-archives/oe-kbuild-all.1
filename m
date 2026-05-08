Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27453101A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 20:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271545; cv=none; b=IPlQI3TiCVoxCuB795E34TTgaM7XONL3Vn0RhGw0My9Z16wy/p4SBz3SEqDO0DEVydtj0h3oEIrYJ0VEYefbOy2RYR9qSNwQRH9Xv80bG/qB+Bklx8Ii/h5RhzsPJKmiPz7hRoWJzvyAYqgrzbxQisea8e38Quhn9QS2sZt61to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271545; c=relaxed/simple;
	bh=hZcCx0DYN4PPjbGgXjiXUOc+N91oiwasAUFsfsmTOOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l1gUU6G8ocX7P5d7oxhp0kwD1OnBEQSjnVgXRa17UR3m6HVoDRnSU46g2ghK4ygsVZUJ43T0lFmQvp5TvbAFsBp+BlsfQu6eZL0GcbXAyy9RZ4TvS5j2sAm5NPD+dR+vYB0NYm1ulJ6hPmxOJv2RCxwGlAmuT9dCEimoc6MnxJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObLb+vL4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObLb+vL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778271543; x=1809807543;
  h=date:from:to:cc:subject:message-id;
  bh=hZcCx0DYN4PPjbGgXjiXUOc+N91oiwasAUFsfsmTOOA=;
  b=ObLb+vL4b2yP2AGIyV3QA1boQnvR75WPgrwWwXlqVJgdkpGgSIGSWllT
   /PxjbR8h/Pa7ah31/Kv2IDiUY9PT4mY+B8uDh8RnpfEITyE3kRelmgSCr
   D5joPNKeqJ3OF69rMj7+m80P/1PoqzM1Erx03ab9IZNRUjnFBQga7j+48
   s4KxhoYygLvRzZnwZ/vGjXR47ZrIwYlBKiO6hZaGCS1GJ8ofb5ZVNvtFB
   jRgyCnan8TAfKfzSDNyGnBWHGC08FmiqKZqUJ1CNLtXt3SYB5zyQw9Q62
   1IyCBE23KJIhEJUcIzmq2XNlH3mjwIl3Mkz/oQb6z5/sJDVy5rnu457+F
   Q==;
X-CSE-ConnectionGUID: 1sikwsJKTvCm3HhZHe6k2Q==
X-CSE-MsgGUID: A507I7wPTIC+dSD59xekuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79106089"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79106089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 13:19:02 -0700
X-CSE-ConnectionGUID: FRKicpXXQTuiste9qb1TSw==
X-CSE-MsgGUID: KOXPQHhpRuulnTE8t5pg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232351050"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2026 13:19:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLRf0-000000007Gb-0V0r;
	Fri, 08 May 2026 20:18:58 +0000
Date: Fri, 08 May 2026 22:18:36 +0200
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 1373/4394]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt):
 'vddrfa1p7-supply' is a required property
Message-ID: <202605082254.bXy9QgFf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 63b35a29d7ad2cafb0076f8b002b30fb74df053a [1373/4394] dt-bindings: net: bluetooth: qualcomm: Fix WCN6855 regulator names
config: arm64-randconfig-2055-20260508 (https://download.01.org/0day-ci/archive/20260508/202605082254.bXy9QgFf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082254.bXy9QgFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605082254.bXy9QgFf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:5846.27-5915.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
--
   arch/arm64/boot/dts/qcom/talos.dtsi:1958.20-1993.5: Warning (simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format error, expected "506d000"
   arch/arm64/boot/dts/qcom/talos.dtsi:4427.27-4490.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/talos-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/talos-evk.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
--
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
--
>> arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
--
>> arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
--
>> arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
