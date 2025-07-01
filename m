Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9CF130A73
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368219; cv=none; b=TacGCiVh0NMklGM0ptasDYlriLPGugTe2DPkrbz1v3uvvxxelOB7VbHAYYlBto1vo0NCFYGWKHmF4Kv+7us/Ur0AXyR9KSDc3sfZvL55+oDGT7JQ4IRWQA2w1EiooM3h3CPeYpgxbmwfQS6HRnp/kKVMiIN1ce+mC2Km8ty0l4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368219; c=relaxed/simple;
	bh=YaA6PlI2AdBYzGYQRw+xypTpp7MyvgwCqx5uGUA4zSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcPOC3ZJYoTu3lOn91cd9l1U4/IsrOZ/5WKXoH97OmnbKBWe2s0R51LGx2Djq9Ck1nIEA7tSKiiyoviWVaSiUvoowWyWD9XRgFTKFmQs+pVj8H44BXw4o7keRQ2rcwgPyNejkn9yw8/Obc8KM5pFRuKX4HEmC8/d8GiePYW8Q+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJszq5Wi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJszq5Wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751368217; x=1782904217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaA6PlI2AdBYzGYQRw+xypTpp7MyvgwCqx5uGUA4zSs=;
  b=NJszq5Wi9Jq4coLJwbP5FFNinBvX6D8ArdexnsgiggGWN+EOYwQii9jv
   HBlL1wMj2s9Yd/zY8XBxNmFEegHoUW2HTO+S2GXwxUSFuUv+dRlxIwi6e
   MUflheI2jC3wLAdPck2es2JnphaZohQs3IhFJF/0dZJBSf3cXk7lningd
   qCA0tmrHB8jPqH5KdVBfZhBCpHnLxeo/8HgNsbZIHErTO4A7aY8NQWHY4
   CUXOONRWhXIGWolWQrjiAfcBrK2/DZSlutiDJmyVqhIP+WWI8257W180E
   SLSJbo2oATpaRQD6JH87D0DPCziTtHxCPN3Bt+CPFaMtsY4QWR6Ok0BMH
   g==;
X-CSE-ConnectionGUID: PPwb1CQhTQmweG9kci+WZQ==
X-CSE-MsgGUID: jFM2plDtSA+n4kmw1TRZIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53350249"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53350249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:10:16 -0700
X-CSE-ConnectionGUID: eFLak1TaQCWpTaJMhnrpvg==
X-CSE-MsgGUID: Qh0VSQF2ThKgxcSINO91Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153905996"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2025 04:10:15 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWYsO-00003x-1p;
	Tue, 01 Jul 2025 11:10:12 +0000
Date: Tue, 1 Jul 2025 13:09:29 +0200
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 5279/6007]
 arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000
 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202507011302.ZqNlBKWX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1343433ed38923a21425c602e92120a1f1db5f7a
commit: 501be7cecec9aaf9cd52e76d0820efd6d0b952e7 [5279/6007] dt-bindings: memory-controller: Define fallback compatible
config: arm-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250701/202507011302.ZqNlBKWX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011302.ZqNlBKWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011302.ZqNlBKWX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/syscon@3e2400: failed to match any schema with compatible: ['brcm,bcm7445-hif-cpubiuctrl', 'syscon']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/syscon@452000: failed to match any schema with compatible: ['brcm,bcm7445-hif-continuation', 'syscon']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/aon-ctrl@410000: failed to match any schema with compatible: ['brcm,brcmstb-aon-ctrl']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: gpio@4172c0 (brcm,bcm7445-gpio): interrupts-extended: [[6, 6], [7, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memory_controllers@f1100000 (simple-bus): $nodename:0: 'memory_controllers@f1100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@0 (brcm,brcmstb-memc): $nodename:0: 'memc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy-v240.1']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy-v1.0']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@80000 (brcm,brcmstb-memc): $nodename:0: 'memc@80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@80000: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@80000/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy-v240.1']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@80000/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy-v1.0']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@100000 (brcm,brcmstb-memc): $nodename:0: 'memc@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@100000: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.1' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@100000/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy-v240.1']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@100000/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy-v1.0']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: sram@ffe00000 (brcm,boot-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
