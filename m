Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9683AEF46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841078; cv=none; b=jgZEWDB8i0AGyrQXnHY50+nxWU/d2bZQhBKr5yIJEjyONqthM/w/q8eT+duZT2H+pk+AjvqQvqoneLBzU5nQJJxn3+4D0HKRj68mEhpAAFwtYg76jfE5XqT1W2k8horbzKcE4aWCWy0n6/T4mYa0xJf7Owur4Hq4WnHVX3rBXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841078; c=relaxed/simple;
	bh=J2nFThsBYSiNyRTDsigYGxRyMi1tE57ziBvDgKH51aM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cohtj9w07rBjya8URab5ynfGJ2HLhrFBznviEOgAWR43y/Hq3XyMnqD74NzkcOhN3hzOf1wDdPAqyeZab/ljeYYx+ZGtJJESexNOpNSYYiXQgMTUw0dEp1zJvv1+w56z53xjN2opXxmeSDwlRzqlQAXYE6X3td+WCkDSlhkOhBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7/U/Sx5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7/U/Sx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841076; x=1823377076;
  h=date:from:to:cc:subject:message-id;
  bh=J2nFThsBYSiNyRTDsigYGxRyMi1tE57ziBvDgKH51aM=;
  b=j7/U/Sx5WhlgVovpnUzVGgwxu3ba4YnYhE34fB/KQu1Mjo/AEG6+ulDY
   MN+AJK6+AO9QyZ/tLY2ueu/9WXG2CAw41b3EagsarHNf/9WGVin6xC7WN
   +NbmwL76y2X5dV06qjCCmZbDpPwdmk456jMMi1NhSgRduPSPQ8hz7YuvZ
   vP0Gudp6Mh1R1nsbR+JeHLaKhMr7TrnbhSVWDvUgmmFnF7eT5jwvh/rmq
   ni22w9coNhfN4pkFLhldBe3PZwdfjs/f8zTWkhqRA67yJ57lsglRG49lZ
   crkC+m/fUXiy/1F7IaQ1JKj/HsHAg058E6Czkkk5KbNeI2jqJkcpaa9oL
   w==;
X-CSE-ConnectionGUID: S21PmidETryuCOM9hDORRQ==
X-CSE-MsgGUID: Knn492MPQJ6HmYuxgXkH2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="553731"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="553731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:37:56 -0700
X-CSE-ConnectionGUID: PC+PNtFCQAG8Ua/T8ki1SA==
X-CSE-MsgGUID: 3LxQZ9VRT3uhYc79XIE/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1105081"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2026 14:37:55 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGNiR-00000000ACT-4Atz;
	Mon, 12 Oct 2026 21:37:51 +0000
Date: Mon, 12 Oct 2026 23:37:14 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 13150/16276]
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dma@f7370000
 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@f7370000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202610122343.RMbO9NRz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eb2586bd40db27d77cc5b724ca9386ed0c71d53
commit: 6b0089d88669c87d69df6fa118c198024494a033 [13150/16276] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261012/202610122343.RMbO9NRz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122343.RMbO9NRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122343.RMbO9NRz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc (simple-bus): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
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
