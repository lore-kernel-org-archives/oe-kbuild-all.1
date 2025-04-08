Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5C1E1C1F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131029; cv=none; b=TF7R6eVo0xQnMu0TJYIGS0Y82FX1KMV0ZVyUrd+r8jL5r3ALLPtJIEp/TtZVg6+YYxJP/Ae2K0jZTsIjRoJ0vDqhc/hMIqvX/SeudTmqTsOwx4xALZ71HkysZ5U3b5oL6mxuWWt2y5dfV5lIq4yYRorzm3Vpfz3B6S7ftVZ4fz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131029; c=relaxed/simple;
	bh=1ZZEDZWuQfTeVv0JZst+901AsjwsAsQwFpHgFok2JrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAR7nwDHvJCL/Ol7mMsuX3FD9gDD6sf2vKJ0WUhfyVxp7VbU3YGK8HsGF+WSVntL5pQfWGS1ZQDNAstMVSrS4Udjex6MyJjIu4gc7SVWM1SzI79TVKzL69YE6gL6d+E1BRjJaQbGMzKSHIQ6iF7HvdqZGY5qfCxVWrTB4V6O7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flTOJmSW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flTOJmSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744131027; x=1775667027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZZEDZWuQfTeVv0JZst+901AsjwsAsQwFpHgFok2JrM=;
  b=flTOJmSWrfnuWKLEhai7o6rKMdGPcSRIdrvcWgVzdaaRdBrTHyyYrBzB
   QqhBOoNOvfN85yFZffZndp+XhvT6VwvfOT7+7Lt3T+ZS/t1cGQoNrM9hv
   tx6lWduBkYJCvfk6w6qphfLLPongrJLWSfyGkVgOdii6w3AsKrA5qisR9
   joADHdw+n1m0ZZCeUo5y5DESmyc0fJusG4k0UStKwsLVr+pZp7egXvYH3
   +c0Cz7LRPSUYkwqTUe8wJbBAvouYQKhMXvx8a83scHGW9+gr8VwSoPdh7
   cTOSCYUI1TfN1uUEwPBwbTUvGJlAOkLWe1iCCEzVeMOBFZt8oZ6X/WdPt
   A==;
X-CSE-ConnectionGUID: UtqzXkIVQ/+fCnz84u26fA==
X-CSE-MsgGUID: w2z9qCbPQ+OobAfW5XCpJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45589606"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45589606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:50:27 -0700
X-CSE-ConnectionGUID: 3KV2OmmaToqkA9BdyOW0Og==
X-CSE-MsgGUID: aWPYhRZYRqiaeldbQgiDtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128194258"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 09:50:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2C9W-0007jb-2i;
	Tue, 08 Apr 2025 16:50:22 +0000
Date: Wed, 9 Apr 2025 00:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko.stuebner@cherry.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 867/1936]
 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202504090013.M7GXvkUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
commit: d9e68266a0f28b010a36b9e8df9694d35c7bb9ed [867/1936] arm64: dts: rockchip: add px30-cobra board variant files
config: arm64-randconfig-051-20250408 (https://download.01.org/0day-ci/archive/20250409/202504090013.M7GXvkUu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090013.M7GXvkUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090013.M7GXvkUu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/px30.dtsi:351.26-371.4: Warning (avoid_unnecessary_addr_size): /syscon@ff010000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:453.23-497.4: Warning (avoid_unnecessary_addr_size): /syscon@ff140000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30'] is too long
   	['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'tsd,px30-cobra-ltk050h3146w-a2' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
   	'tsd,px30-cobra-ltk050h3146w-a2' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
   	'ariaboard,photonicat' was expected
   	'armsom,sige5' was expected
   	'armsom,sige7' was expected
--
   	'google,veyron-mickey-rev6' was expected
   	'google,veyron-mighty-rev3' was expected
   	'google,veyron-minnie-rev2' was expected
   	'google,scarlet-rev14-sku0' was expected
   	'google,scarlet-rev14-sku7' was expected
   	'google,scarlet-rev15-sku6' was expected
   	'google,veyron-speedy-rev7' was expected
   	'google,veyron-tiger-rev6' was expected
   	'rockchip,rk3399pro' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: /: failed to match any schema with compatible: ['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30']
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: /: failed to match any schema with compatible: ['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30']
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: touchscreen@14: 'goodix,calibration-data' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: touchscreen@14: goodix,calibration-data: b'Q\xd0\x02\x00\x05\x055\x00\x01\x0f(\x0fZ<\x03\x00\x00\x00\x00\x00\x00\x00\x08\x18\x1a\x1e\x14\x8b+\x0c,.\xbb\n\x00\x00\x01\x01\x03-\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00(d\x94\xd5\x02\x08\x00\x00\x04\x80,\x00m4\x00[?\x00ML\x00B[\x00B\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x04\x06\x08\n\x0c\x0e\x10\x12\x14\x16\x18\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&$"! \x1f\x1e\x1d\x1c\x18\x16\x13\x12\x10\x0f\x0c\n\x08\x06\x04\x02\x00\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: mmc@ff370000: Unevaluated properties are not allowed ('supports-sd' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: mmc@ff390000: Unevaluated properties are not allowed ('supports-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: pwm-leds: 'ring_blue', 'ring_green', 'ring_red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:351.26-371.4: Warning (avoid_unnecessary_addr_size): /syscon@ff010000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:453.23-497.4: Warning (avoid_unnecessary_addr_size): /syscon@ff140000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30'] is too long
   	['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'tsd,px30-cobra-ltk050h3146w' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
   	'tsd,px30-cobra-ltk050h3146w' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
   	'ariaboard,photonicat' was expected
   	'armsom,sige5' was expected
   	'armsom,sige7' was expected
--
   	'google,veyron-mickey-rev6' was expected
   	'google,veyron-mighty-rev3' was expected
   	'google,veyron-minnie-rev2' was expected
   	'google,scarlet-rev14-sku0' was expected
   	'google,scarlet-rev14-sku7' was expected
   	'google,scarlet-rev15-sku6' was expected
   	'google,veyron-speedy-rev7' was expected
   	'google,veyron-tiger-rev6' was expected
   	'rockchip,rk3399pro' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: /: failed to match any schema with compatible: ['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30']
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: /: failed to match any schema with compatible: ['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30']
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: touchscreen@14: 'goodix,calibration-data' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: touchscreen@14: goodix,calibration-data: b'Q\xd0\x02\x00\x05\x055\x00\x01\x0f(\x0fZ<\x03\x00\x00\x00\x00\x00\x00\x00\x08\x18\x1a\x1e\x14\x8b+\x0c,.\xbb\n\x00\x00\x01\x01\x03-\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00(d\x94\xd5\x02\x08\x00\x00\x04\x80,\x00m4\x00[?\x00ML\x00B[\x00B\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x04\x06\x08\n\x0c\x0e\x10\x12\x14\x16\x18\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&$"! \x1f\x1e\x1d\x1c\x18\x16\x13\x12\x10\x0f\x0c\n\x08\x06\x04\x02\x00\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: mmc@ff370000: Unevaluated properties are not allowed ('supports-sd' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: mmc@ff390000: Unevaluated properties are not allowed ('supports-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: pwm-leds: 'ring_blue', 'ring_green', 'ring_red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:351.26-371.4: Warning (avoid_unnecessary_addr_size): /syscon@ff010000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:453.23-497.4: Warning (avoid_unnecessary_addr_size): /syscon@ff140000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30'] is too long
   	['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'tsd,px30-cobra-ltk500hd1829' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
   	'tsd,px30-cobra-ltk500hd1829' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
   	'ariaboard,photonicat' was expected
   	'armsom,sige5' was expected
   	'armsom,sige7' was expected
--
   	'google,veyron-mickey-rev6' was expected
   	'google,veyron-mighty-rev3' was expected
   	'google,veyron-minnie-rev2' was expected
   	'google,scarlet-rev14-sku0' was expected
   	'google,scarlet-rev14-sku7' was expected
   	'google,scarlet-rev15-sku6' was expected
   	'google,veyron-speedy-rev7' was expected
   	'google,veyron-tiger-rev6' was expected
   	'rockchip,rk3399pro' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: /: failed to match any schema with compatible: ['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30']
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: /: failed to match any schema with compatible: ['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30']
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: touchscreen@14: 'goodix,calibration-data' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: touchscreen@14: goodix,calibration-data: b'Q\xd0\x02\x00\x05\x055\x00\x01\x0f(\x0fZ<\x03\x00\x00\x00\x00\x00\x00\x00\x08\x18\x1a\x1e\x14\x8b+\x0c,.\xbb\n\x00\x00\x01\x01\x03-\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00(d\x94\xd5\x02\x08\x00\x00\x04\x80,\x00m4\x00[?\x00ML\x00B[\x00B\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x04\x06\x08\n\x0c\x0e\x10\x12\x14\x16\x18\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&$"! \x1f\x1e\x1d\x1c\x18\x16\x13\x12\x10\x0f\x0c\n\x08\x06\x04\x02\x00\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: mmc@ff370000: Unevaluated properties are not allowed ('supports-sd' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: mmc@ff390000: Unevaluated properties are not allowed ('supports-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk500hd1829.yaml#
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: pwm-leds: 'ring_blue', 'ring_green', 'ring_red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
