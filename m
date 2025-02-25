Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755221ABC6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 19:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511714; cv=none; b=uvLPYh5BTmdWJSJ9VzaTDZYlTLN1u6/2HNe720HQpTAZqL4IRTsWUlkCe9ltyKzrPeMY8YVEkeq/jl2Ci5BxCNd9wjBCzn8OYz7s694G/B/L4AUj4Q4meF7MTmlvlA3XM/t7y7MeXXP4KrY9mxZk4MjxQuSwNX3tP+AQcv8StXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511714; c=relaxed/simple;
	bh=bs/O23s4eDdWPBT+DwB6nj+vhjxVW2yBXWwQ/18cNjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sapI3NZyGEDS82XTwDzWq+aGf9PlBN1tC17OKdYZRFBPjgYPkbxZnYMoU9vkl8meYY6IuauIKAnwkLIvHhT7br9l5Vuy7NOvqCbnPTFnAbhl6DgdYzmaMq3n7YosEqtf0TiMAws/cAna6REVZk+L6Mgjgh07l0R4T7V5HFr0pgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjQGHd0V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjQGHd0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740511711; x=1772047711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bs/O23s4eDdWPBT+DwB6nj+vhjxVW2yBXWwQ/18cNjc=;
  b=CjQGHd0Vy0iduI3o/X+2ec/p4LBcfR7NIvLsiEZ5LX9KT2QlrxZM4jBE
   pgNU6SGWhCTSy3JPr81tvwrpmZSCQiZ5oGt0hhnfdBCPmaKZ2Bb4q0BwR
   Q+LLuegyDsor9Tssb8AkEDBGJPySkDvTXqABUjobyE6eLxBI3mPbk+P9s
   WWWg1jvxUQEKes9gb4aBCQDgeWJI0OqUkoXdIC+PJiIbAXuhZhUAWyPy/
   Bi4IP0MPc8NyZUJ1lrsMqzVrT9QZC53KAX0PvPrp9ob3e/WVopsaQNxUt
   DWL3sY4yJ40ZRg+/0abfvKvKfWn1mpUrx8MzbHYugX0V5uui67CGENf+c
   Q==;
X-CSE-ConnectionGUID: hTyMxt5eTbiwvijJX9K6yQ==
X-CSE-MsgGUID: MaEwul3yTBafpUf67RwBBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41464351"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41464351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 11:28:23 -0800
X-CSE-ConnectionGUID: 9OMRybggSeW4LgnPm29UFw==
X-CSE-MsgGUID: X0+NO5rIRCCY7q/n7XmcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116260824"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2025 11:28:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn0bL-000Af1-2o;
	Tue, 25 Feb 2025 19:28:19 +0000
Date: Wed, 26 Feb 2025 03:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /ir-receiver@10013000:
 failed to match any schema with compatible: ['mediatek,mt7623-cir']
Message-ID: <202502260315.WYheGCSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   8e76d55979c1abc234e6fa16e4d697c318a38ea2
commit: b2c5d45b05d26ffa82636af3f431a4daa96fed6c [1/1] ARM: dts: mediatek: mt7623: fix IR nodename
config: arm-randconfig-051-20250220 (https://download.01.org/0day-ci/archive/20250226/202502260315.WYheGCSF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502260315.WYheGCSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502260315.WYheGCSF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /ir-receiver@10013000: failed to match any schema with compatible: ['mediatek,mt7623-cir']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /ir-receiver@10013000: failed to match any schema with compatible: ['mediatek,mt7623-cir']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /ir-receiver@10013000: failed to match any schema with compatible: ['mediatek,mt7623-cir']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323: failed to match any schema with compatible: ['mediatek,mt6323']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/leds: failed to match any schema with compatible: ['mediatek,mt6323-led']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/mt6323regulator: failed to match any schema with compatible: ['mediatek,mt6323-regulator']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/mt6397codec: failed to match any schema with compatible: ['mediatek,mt6397-codec']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: power-controller: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/power-controller: failed to match any schema with compatible: ['mediatek,mt6323-pwrc']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /pwrap@1000d000/mt6323/rtc: failed to match any schema with compatible: ['mediatek,mt6323-rtc']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /ir-receiver@10013000: failed to match any schema with compatible: ['mediatek,mt7623-cir']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /interrupt-controller@10200100: failed to match any schema with compatible: ['mediatek,mt7623-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
