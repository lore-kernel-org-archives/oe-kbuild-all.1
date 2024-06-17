Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562918628D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718612538; cv=none; b=fhvQZYMtpVpV9xUa+o/KtMCy+vXhlUKCrLD5fk/rqG5yicktBckQ0L2Tr/ZEWzJyTYdSEMJbRCRrorc4G4yJFNWMLwdJUF/VDcVbhQ6JzolGaQYCSdeXO9JDO5JQmLY+WVzKXVwDJJlUo8equjqd5NsflQCZhJKsIafQxFaeEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718612538; c=relaxed/simple;
	bh=g/0A3l0kxfaGDWtphwjgrFjofCriLxZ02lgaz+00VuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZAjOHPvN75FLwV9p0fXetJO1TSaoagJHU0PkthlcdYfLpKiYy9boqEnDqyjpQn7r46tzHOaeQcDAXf/h9h2vFdaYOgrF1CEx1XWI+r/aRGZipEOytjuxdEFMMWCqzUhOqhQdCzIouScOcJUaAYQylaX2aHiXYE2T0VHNeQofsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwVO6xts; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwVO6xts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718612536; x=1750148536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/0A3l0kxfaGDWtphwjgrFjofCriLxZ02lgaz+00VuU=;
  b=BwVO6xts412QYoq/YcgSlh8PdhICTe7V4Q3nW5hGmttALlXy4VfpwlNi
   3noaxGdquzvdDYlbQcgRl1EkuSqaHS0HI5ml+ciRZEd37jCZsJH0Vvf69
   fxjSNFs6nC72X/JSe0G4e7aINwurQ0YjMECrleVZbhwOHeLgqSEmPEftV
   MNrvR860BqohsTitLb9SwS7GzyEuCLDFHI6drJJ+l+rHaPiiUEL1qhNVP
   k4LKsgS7q3du1RqgbuEzv4wKtgC4gFgqfYsvbZ1nkHGnqxrLqvln+yTyy
   33GceYxhlqigXrjfvKMbnyQLdHaQ4T8HwmeWwLwDaCCdmSO6p8k0cuZ6q
   A==;
X-CSE-ConnectionGUID: qiESpBXLQWW7dqZ2xKFbfw==
X-CSE-MsgGUID: mKLNOopZRTmjKtusjhOq6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26822350"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26822350"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 01:22:15 -0700
X-CSE-ConnectionGUID: i+tFwQbCRsGX+LEQlpKK7A==
X-CSE-MsgGUID: 1I2xWvvZS5yiwzsbSzL8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41843240"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2024 01:22:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ7cw-00042e-22;
	Mon, 17 Jun 2024 08:22:10 +0000
Date: Mon, 17 Jun 2024 16:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sean Young <sean@mess.org>
Subject: [hverkuil-media-tree:for-v6.11c 9/21]
 arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0:
 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
Message-ID: <202406171622.1BOIHoPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.11c
head:   bfd8308fd5437a3c453dfc379badcaffe0a676ce
commit: dce30a66120fa092d28e2741f0890a5738b32fda [9/21] dt-bindings: media: convert Mediatek consumer IR to the json-schema
config: arm-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171622.1BOIHoPB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171622.1BOIHoPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171622.1BOIHoPB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623a-scpsys']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
--
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623a-scpsys']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: cir@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: cir@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
--
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: cir@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: cir@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: cir@10013000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
--
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: cir@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: cir@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: cir@10013000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
