Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B36443E3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141607; cv=none; b=k3fe6XbfDCjlmb4zsuP2aTt/LO6knNstEVDGW5gF4oOyFcysSnL24BVHYWhjGIz/iAAv2XfoJgx3O4+5jZ2GZJpp9VilMPMf4KIgiKfs2T0hgMBqxu8HdwXoHTbtNxpBbq2WF8khWiN7/TtRp8KgrPDy3620uvCjJYULzpaPg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141607; c=relaxed/simple;
	bh=2MYSmmy4ctpzXeMuxGv8qLm4r1C9yWXOfVmAVSwLKy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cn9BWrkJXtqnMoiPlz/3yMmEx5DHsNcDmPnZxeXm3rTOC1kj2RChdyXrb/3yfDyhIkvrBJUmTmDqo8sgiL+VHtFOcspKZfc43NLDEn2Ktq9UI/PRnJ09WkB4z+bSa/HjaFaCv2A7CfiGi+ZCbWOkfFat5JRbrKK7OB7rQeQb4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oso3QUZ9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oso3QUZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792141606; x=1823677606;
  h=date:from:to:cc:subject:message-id;
  bh=2MYSmmy4ctpzXeMuxGv8qLm4r1C9yWXOfVmAVSwLKy8=;
  b=Oso3QUZ9ECga9r/lgbWr6tpK2rpyNQdGT8MO9QJbz9DAC+b32uU/QVS5
   l/mR81O5Ykz6NlTjc3++FkC2EKIFSjdS4cfx3eZSf7LjlLdZQ7xkqJd63
   qwe8DtiS1W7b+l2ShEpbiNXfqIrmW94qKtmNIK2nnPf2O0oDR5tO/9Or9
   /zKHafhmZ1jmpT2ijMqRchJctgppk5X6SrT/bMCiUGxtC2haeB5SFMiSs
   B5RRaV5mmwAJTrPElAro6hgVavuZPC0CJ2tkm+j80iMfSeKCXxAVWd0Xp
   hm897dCGu/3IFrdWnvTC/8xHsJiW/AdWfNLz76S3842vbJwlSY5sH85l2
   w==;
X-CSE-ConnectionGUID: n1f5EwLwSD6fTDbvD4++eA==
X-CSE-MsgGUID: ep5wmBzGT6GttoD5zymWGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="802752"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="802752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 02:06:44 -0700
X-CSE-ConnectionGUID: WACG4KS0S4awlGamlk6wbw==
X-CSE-MsgGUID: MqQhDORbSHGlr7yaYnl4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2319577"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2026 02:06:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHdtg-00000000C9Z-1P44;
	Fri, 16 Oct 2026 09:06:40 +0000
Date: Fri, 16 Oct 2026 11:05:58 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 12763/17613]
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dma@f7370000
 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@f7370000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202610161137.DzvgdaVH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b810335a0699d1810683796b0e3ffe8827ddfe6c
commit: 6b0089d88669c87d69df6fa118c198024494a033 [12763/17613] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261016/202610161137.DzvgdaVH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161137.DzvgdaVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161137.DzvgdaVH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc (simple-bus): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc (simple-bus): usbphy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/acpu_sctrl@f6504000: failed to match any schema with compatible: ['hisilicon,hi6220-acpu-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: medianoc_ade@f4520000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/stub_clock: failed to match any schema with compatible: ['hisilicon,hi6220-stub-clk']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: stub_clock (hisilicon,hi6220-stub-clk): hisilicon,hi6220-clk-sram: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dma@f7370000 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@f7370000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
--
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: dma@fdf30000 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@fdf30000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: spi@ffd68000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: spi@ff3b3000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000 (snps,dwc3): resets: [[31, 144, 8], [31, 144, 7], [31, 144, 6], [31, 144, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: funnel (arm,coresight-static-funnel): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: reboot-mode-syscon@32100000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
