Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415822C9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770929144; cv=none; b=d7jItni7h555U21RXKSgxYx14LwvOjnS84fXYfPTXBEFVflZPj3prNuXBK2ELqqsgZY+i4sEbUozmWNO0E/AWQp6wWQZMB6YptMFsCdtA7rBQL6xnbk+R1n+WVeQhLDzVZQIV9BuBSZzpJ5UrYMmQtnkAJBfNIJq7A7xn06Z+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770929144; c=relaxed/simple;
	bh=7oi/B7B5qWE8WqTcXTdMn0ssig1ndAyBI6peGLOhwkA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lekqyms5k6NM2xPNVahHmNx5JrFwxoPi4ksMuUCmGVQWo7Og8vyt2t1dvqdkm7EvNRF3p+lKf6DND4I2Gt+PWA1AjQOQMGP7xn31DKVo2/zfvm0v0NpOIZ7P3bcspnhNkXC/W9ZImlKbc9dCZ94vmkOqJgiig/926gDg+nkFgvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPTJrJEs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPTJrJEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770929141; x=1802465141;
  h=date:from:to:cc:subject:message-id;
  bh=7oi/B7B5qWE8WqTcXTdMn0ssig1ndAyBI6peGLOhwkA=;
  b=DPTJrJEs9m+rBisV1sHj0fVIO1gJ7xeOKgVIrFpJpHnXZsPQqm8xmRYG
   vnZkDLMifrPMJKBGBUEuzeOqVdcun7fr1Ar/t9yGOzZjb/MAutBHvkGzl
   8Z4ThGMtLSWnpiy5hKBjZcoO9e1yyahOOQ45jLN3BwM9XkuK8o77oJr24
   UKgxSptUcRl6gvlkeyuoq8kyUguq06rbcwEdNSm0e2IJO/Uhg6GbNIHv3
   aKWK8q4Zu5G+YcP3FdIUTey1x6q08rOF7s8AxTCSxKMw9oy3RNhBeGOVB
   I3FOiv9Op6yZ4mUcmFgWUWE+ZwIjik/QiE7nOpKK9U6yy2CHTfy/L0zgc
   A==;
X-CSE-ConnectionGUID: fqoydGCzR3GdoYs4KUFRAw==
X-CSE-MsgGUID: GK1Gy3XhQbKRTgL/2evjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="59684408"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="59684408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 12:45:41 -0800
X-CSE-ConnectionGUID: 4nEZj11tQjO+5NbDnU08tQ==
X-CSE-MsgGUID: fXp5SMBnRP+BVQb0LnLYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211938017"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2026 12:45:38 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqdZA-000000001NX-2u6D;
	Thu, 12 Feb 2026 20:45:36 +0000
Date: Thu, 12 Feb 2026 21:45:18 +0100
From: kernel test robot <lkp@intel.com>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 11157/12487]
 arch/arm/boot/dts/ti/omap/am571x-idk.dtb: pciephy@4000 (ti,phy-pipe3-pcie):
 $nodename:0: 'pciephy@4000' does not match
 '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
Message-ID: <202602122133.j2aFsyjb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd9678829d6dd0c10fde080b536abf4b1121c346
commit: 62c9ff8fc20d23c0dc36be1330734fdafb3e8585 [11157/12487] dt-bindings: phy: ti,phy-usb3: convert to DT schema
config: arm-randconfig-2053-20260210 (https://download.01.org/0day-ci/archive/20260212/202602122133.j2aFsyjb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602122133.j2aFsyjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602122133.j2aFsyjb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/interconnect@4a000000/segment@0/target-module@62000/usbhstll@0: failed to match any schema with compatible: ['ti,usbhs-tll']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/interconnect@4a000000/segment@0/target-module@64000/usbhshost@0: failed to match any schema with compatible: ['ti,usbhs-host']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/interconnect@4a000000/segment@0/target-module@66000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: segment@80000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: segment@80000 (simple-pm-bus): $nodename:0: 'segment@80000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@0/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: usb3phy@4400 (ti,omap-usb3): $nodename:0: 'usb3phy@4400' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@10000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml
--
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/interconnect@4a000000/segment@0/target-module@62000/usbhstll@0: failed to match any schema with compatible: ['ti,usbhs-tll']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/interconnect@4a000000/segment@0/target-module@64000/usbhshost@0: failed to match any schema with compatible: ['ti,usbhs-host']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/interconnect@4a000000/segment@0/target-module@66000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: segment@80000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: segment@80000 (simple-pm-bus): $nodename:0: 'segment@80000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@0/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: usb3phy@4400 (ti,omap-usb3): $nodename:0: 'usb3phy@4400' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@10000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml
--
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/interconnect@4a000000/segment@0/target-module@62000/usbhstll@0: failed to match any schema with compatible: ['ti,usbhs-tll']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/interconnect@4a000000/segment@0/target-module@64000/usbhshost@0: failed to match any schema with compatible: ['ti,usbhs-host']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/interconnect@4a000000/segment@0/target-module@66000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: segment@80000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: segment@80000 (simple-pm-bus): $nodename:0: 'segment@80000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@0/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: usb3phy@4400 (ti,omap-usb3): $nodename:0: 'usb3phy@4400' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@10000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml
--
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@62000/usbhstll@0: failed to match any schema with compatible: ['ti,usbhs-tll']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@64000/usbhshost@0: failed to match any schema with compatible: ['ti,usbhs-host']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@66000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: segment@80000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: segment@80000 (simple-pm-bus): $nodename:0: 'segment@80000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@0/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: usb3phy@4400 (ti,omap-usb3): $nodename:0: 'usb3phy@4400' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/interconnect@4a000000/segment@80000/target-module@10000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
