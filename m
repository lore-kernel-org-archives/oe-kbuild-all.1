Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF702C3248
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748836224; cv=none; b=ktKX+W2QEvarXchQYB7tXEQrWcZry40HUpWf72hKvvSZsDk+78WryVtc14GHmKqmP6+cCxRk3m9qUDRnGg2Dgc8OcZywIP5vBo1V+Aj3V0Oq3X0c4CdbL4p2rkvHs4BBt47VXOyUKCYcdHz6aZpaAbXJzw9ExfrRxxLYEKKmOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748836224; c=relaxed/simple;
	bh=BTkkic0TOhisyRCty0IxW4IRK42L8eHKZNZwfUmi2wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ln650bLxCmU9eENVSHedFwQ8z+U8S+TL1MXY0fJhfq4vCRsIWiRKvM4wcRSY7Dtg1nDrMOROknjAX8u24+YCbK0RDQ6SOqekx2oQYYicpQqKxeMgo2M1Ys3skKykSgEb1tyoFwiuN9VGC6KkRHVziprnX6vMYKbj/Z+sEExDSrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ab0udoyy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ab0udoyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748836222; x=1780372222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTkkic0TOhisyRCty0IxW4IRK42L8eHKZNZwfUmi2wE=;
  b=ab0udoyySb4lte3wUMTZ4Kj+h7N9CqGNqWk/WYZ3TF7KbYjlkgN+lAi8
   V7cwye0NCwb+mudz+Qd7RNHKGjnQwTaECkmhj4ZtCi19a2lyVXT1M9F22
   9gw/Wr5czDPPPwjLajvoOcxaNvOlC5e5iIaMOOTawqV0uTzzkhJHSbf6o
   7NON+57NaQG5AyfgZ6xY4YzcKwHwAc6XZDBxTo0zgSg8gEKoYu002LuSd
   XM9vroQSPt3sNdeH/XXwfaqVzGPKcPlibtgjbTZAqBiuX7hiBueqTkyOi
   5SxsWNxTVT/nGP6owizMZHVO8aKzEtbJ95EjPQN0o+uhrL2w7EFLg+bex
   Q==;
X-CSE-ConnectionGUID: 0Kl4jxidQqiJztlnqDgsZw==
X-CSE-MsgGUID: fOyrJ2g7Tsa2y3TNFqFHxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50845121"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="50845121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 20:50:21 -0700
X-CSE-ConnectionGUID: 6ndurpZTQzmYXwHaLHfhmg==
X-CSE-MsgGUID: o1Q62+ebTpSjKI7x2dTBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="175304061"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2025 20:50:20 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLwBm-0001FC-0A;
	Mon, 02 Jun 2025 03:50:18 +0000
Date: Mon, 2 Jun 2025 11:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>
Subject: [linux-next:master 10414/13986]
 arch/arm/boot/dts/marvell/dove-cubox.dtb: sata-host@a0000
 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match
 '^sata(@.*)?$'
Message-ID: <202506021115.QA99Kuqs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3a83b350b5be4b4f6bd895eecf9a92080200ee5d
commit: 6130ed3cd0b4c5e22757e7aa1819abd66f0987e3 [10414/13986] dt-bindings: ata: Convert marvell,orion-sata to DT schema
config: arm-randconfig-2052-20250601 (https://download.01.org/0day-ci/archive/20250602/202506021115.QA99Kuqs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506021115.QA99Kuqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506021115.QA99Kuqs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/ethernet-ctrl@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/mdio-bus@72004/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1310']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: ethernet-phy@1 (marvell,88e1310): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1310'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1310' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm/boot/dts/marvell/dove-cubox.dtb: sdio-host@92000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@92000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
>> arch/arm/boot/dts/marvell/dove-cubox.dtb: sata-host@a0000 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/marvell,orion-sata.yaml#
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/sata-phy@a2000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/audio-controller@b0000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/audio-controller@b4000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: power-management@d0000 (marvell,dove-pmu): domains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-cubox.dtb: power-management@d0000 (marvell,dove-pmu): $nodename:0: 'power-management@d0000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/power-management@d0000: failed to match any schema with compatible: ['marvell,dove-pmu', 'simple-bus']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /mbus/internal-regs/power-management@d0000/thermal-diode@1c: failed to match any schema with compatible: ['marvell,dove-thermal']
--
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: ethernet-phy@1 (marvell,88e1310): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1310'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1310' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: sdio-host@92000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@92000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: sdio-host@92000 (marvell,dove-sdhci): Unevaluated properties are not allowed ('cd-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
>> arch/arm/boot/dts/marvell/dove-cubox-es.dtb: sata-host@a0000 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/marvell,orion-sata.yaml#
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: /mbus/internal-regs/sata-phy@a2000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: /mbus/internal-regs/audio-controller@b0000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: /mbus/internal-regs/audio-controller@b4000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: power-management@d0000 (marvell,dove-pmu): domains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: power-management@d0000 (marvell,dove-pmu): $nodename:0: 'power-management@d0000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: /mbus/internal-regs/power-management@d0000: failed to match any schema with compatible: ['marvell,dove-pmu', 'simple-bus']
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: /mbus/internal-regs/power-management@d0000/thermal-diode@1c: failed to match any schema with compatible: ['marvell,dove-thermal']
--
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: sdio-host@90000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: sdio-host@90000 (marvell,dove-sdhci): Unevaluated properties are not allowed ('bus-width', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/ethernet-ctrl@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/ethernet-ctrl@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: sdio-host@92000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@92000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: sdio-host@92000 (marvell,dove-sdhci): Unevaluated properties are not allowed ('bus-width', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
>> arch/arm/boot/dts/marvell/dove-d2plug.dtb: sata-host@a0000 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/marvell,orion-sata.yaml#
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/sata-phy@a2000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/audio-controller@b0000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/audio-controller@b4000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: power-management@d0000 (marvell,dove-pmu): domains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: power-management@d0000 (marvell,dove-pmu): $nodename:0: 'power-management@d0000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/power-management@d0000: failed to match any schema with compatible: ['marvell,dove-pmu', 'simple-bus']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /mbus/internal-regs/power-management@d0000/thermal-diode@1c: failed to match any schema with compatible: ['marvell,dove-thermal']
--
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: sdio-host@90000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: sdio-host@90000 (marvell,dove-sdhci): Unevaluated properties are not allowed ('non-removable' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/ethernet-ctrl@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/ethernet-ctrl@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: sdio-host@92000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@92000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: sdio-host@92000 (marvell,dove-sdhci): Unevaluated properties are not allowed ('bus-width', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
>> arch/arm/boot/dts/marvell/dove-d3plug.dtb: sata-host@a0000 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/marvell,orion-sata.yaml#
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/sata-phy@a2000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/audio-controller@b0000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/audio-controller@b4000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: power-management@d0000 (marvell,dove-pmu): domains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: power-management@d0000 (marvell,dove-pmu): $nodename:0: 'power-management@d0000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/power-management@d0000: failed to match any schema with compatible: ['marvell,dove-pmu', 'simple-bus']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /mbus/internal-regs/power-management@d0000/thermal-diode@1c: failed to match any schema with compatible: ['marvell,dove-thermal']
--
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/crypto-engine@30000: failed to match any schema with compatible: ['marvell,dove-crypto']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/dma-engine@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/dma-engine@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: sdio-host@90000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/ethernet-ctrl@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/ethernet-ctrl@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: sdio-host@92000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@92000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
>> arch/arm/boot/dts/marvell/dove-dove-db.dtb: sata-host@a0000 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/marvell,orion-sata.yaml#
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/sata-phy@a2000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/audio-controller@b0000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/audio-controller@b4000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: power-management@d0000 (marvell,dove-pmu): domains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: power-management@d0000 (marvell,dove-pmu): $nodename:0: 'power-management@d0000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/power-management@d0000: failed to match any schema with compatible: ['marvell,dove-pmu', 'simple-bus']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /mbus/internal-regs/power-management@d0000/thermal-diode@1c: failed to match any schema with compatible: ['marvell,dove-thermal']
--
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/dma-engine@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/dma-engine@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: sdio-host@90000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/ethernet-ctrl@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/ethernet-ctrl@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: sdio-host@92000 (marvell,dove-sdhci): $nodename:0: 'sdio-host@92000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: sdio-host@92000 (marvell,dove-sdhci): Unevaluated properties are not allowed ('vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,dove-sdhci.yaml#
>> arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: sata-host@a0000 (marvell,orion-sata): $nodename:0: 'sata-host@a0000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/marvell,orion-sata.yaml#
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/sata-phy@a2000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/audio-controller@b0000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/audio-controller@b4000: failed to match any schema with compatible: ['marvell,dove-audio']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: power-management@d0000 (marvell,dove-pmu): domains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: power-management@d0000 (marvell,dove-pmu): $nodename:0: 'power-management@d0000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/power-management@d0000: failed to match any schema with compatible: ['marvell,dove-pmu', 'simple-bus']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /mbus/internal-regs/power-management@d0000/thermal-diode@1c: failed to match any schema with compatible: ['marvell,dove-thermal']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
