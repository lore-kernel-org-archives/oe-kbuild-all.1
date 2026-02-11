Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335B3EBF2C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770831152; cv=none; b=BUBxI0YA1v4mOBBEgdLVnU7QRnrkpXrCymVm9jCvqGFcGwePQIVyWKFqOhLmrQCzPVcLvWCUHHKbFOFOH4xIwk16bQ1Acf9Lw5ZUYQw92HCfrLenKth3nBnqTERdmqCtLjgIiST9hTCdO4C8ap59F5MTdJU1ZJ1vSQTWQjUorCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770831152; c=relaxed/simple;
	bh=vX2/8bHIh1H+c9u54wArk7UIC3HjMM4eA+QGBumZxdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fOUvu0JGOQKbngW6S0nO4ZSrhQt7OzYgvZPNq2k9SjRlP18B4z4GSqFW6UwhLIiRyqJlNZ+Cc/mJOq5N8bhz4NYx0U1cmz7xlUvTop8bZcqofBPW6pkdPNKd0sFFlAZstXe616RhRSFOvcOmfCPJjg80iExlGNBTJiuHBQPBOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7IR9dzX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7IR9dzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770831151; x=1802367151;
  h=date:from:to:cc:subject:message-id;
  bh=vX2/8bHIh1H+c9u54wArk7UIC3HjMM4eA+QGBumZxdw=;
  b=V7IR9dzXBDNc4KFDgCrIyvK/CrEbC5162dOPFwFh+/vkXN2Ug5fpRn4o
   L8zTD4HZ0t2WXO5X7z/qRch2JrwLfQ0F28bBQtMbxgmSFmSgjz2DJqlvD
   /HHQGwAWUQX/ipX1z2sDYFf8L55dgZE7BpOXmAT6B57th9iTkPjrtBfHh
   qSQcOD1oWUKV/O7XEcLJCWNyYT7b4MjQNd4TqXo7XDyfIO/gjc+wShuPK
   E48kx4Tt6FgXOiriogx+UMm7Tf0P7qLyi1YpC5Lnp9xPjs2IAC/sRLncW
   cDl3yvBnuIerkqFVyWKd+HTYbnvwFJd2+b/lpuLhMz/7lp25cJeQ0T1Tc
   w==;
X-CSE-ConnectionGUID: pPFbQR8lSKyGZ6Jk6ZmN+Q==
X-CSE-MsgGUID: OPqwnDUkTLeeoKVivSt6/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71974798"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71974798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 09:32:30 -0800
X-CSE-ConnectionGUID: XgC6c5nHTwqH/3HZKHb6kg==
X-CSE-MsgGUID: ASrYFQqtRtqPSWrquQKHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212336094"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2026 09:32:27 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqE4f-0000000017R-1Hcq;
	Wed, 11 Feb 2026 17:32:25 +0000
Date: Wed, 11 Feb 2026 18:31:53 +0100
From: kernel test robot <lkp@intel.com>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 11157/12487]
 arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: pciephy@4000
 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match
 '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
Message-ID: <202602111817.HuFJlQAN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd9678829d6dd0c10fde080b536abf4b1121c346
commit: 62c9ff8fc20d23c0dc36be1330734fdafb3e8585 [11157/12487] dt-bindings: phy: ti,phy-usb3: convert to DT schema
config: arm-randconfig-2052-20260210 (https://download.01.org/0day-ci/archive/20260211/202602111817.HuFJlQAN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111817.HuFJlQAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111817.HuFJlQAN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@28 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@56000/dma-controller@0: failed to match any schema with compatible: ['ti,omap4430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@80000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: phy@4000 (ti,dra7x-usb2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: phy@5000 (ti,dra7x-usb2-phy2): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@90000/ocp2scp@0: failed to match any schema with compatible: ['ti,omap-ocp2scp']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: pciephy@4000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@4000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: pciephy@5000 (ti,phy-pipe3-pcie): $nodename:0: 'pciephy@5000' does not match '^(pcie-phy|usb3-phy|phy)@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,phy-usb3.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sata@0 (snps,dwc-ahci): reg: [[0, 4352], [4352, 8]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
