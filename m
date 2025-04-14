Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063AD2EAE6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744608369; cv=none; b=PG5cLpSeFBHKPgNYWJzoH5QQaLXf+idigtAYux2OVqz3/Pn/rXhapBFXG4y9mcqUWpkQ9rdjTJmQ73pNHlGHIpftxU062Kyp4OUlrPiJjHfxATCrnaqbDmCPLnGmiHB1M2ATW1zO8dh0ufmBes2pgFQpgYRGdp+KBAOh6tw9Cno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744608369; c=relaxed/simple;
	bh=g0YZD33tyNvQfVkYk7bNW6FDxzUhPZdgynTFv9Xuirg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q34871vniqbCC0+vrgxLOcLubk42s0ZRMqRAZAobN+YB5QpLca71Jp3gqY1fY8hsITn/qtpYlP1VYr/3KE5naRE1HXQSa3LVFnecscwIXYz0E+ZHj662jKN9kajuyqcHkLoamGaeVNm7a1z1y+TnxbTsVXDJmgxYBCSUWXj/Rjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZAcVWh2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZAcVWh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744608366; x=1776144366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0YZD33tyNvQfVkYk7bNW6FDxzUhPZdgynTFv9Xuirg=;
  b=GZAcVWh2jTy7G3Wh6R//HmHe7XX8Oq0245MmqtRBeGdWnIvDMalgr4eE
   Oa47DeXA7GdfK2Q3KpxL3WntcR8tzgp4BrK1He6myKnJlS1zsbBLlucPg
   HOHTSp4uUh5TTCobVNcu7WeIqNWwAKsXmoxV3Gn9akr/X5ARtbHI2CNWu
   I+me7OxltgZo3iZi1FCLlK9I5USpLolc1dlPnSCqSlr9s8hggv+6Tg1oi
   zgZxq8Iwdwrp3gzwdNOMBCb0xqJMJ3ieOUQkObmeSjXJ+dHARXuAvMIgC
   WEXOp30ueRscxnhL/iAnur2DI5qNwbo9uJfBEy8Q8KclsVSM3qf6oobSq
   A==;
X-CSE-ConnectionGUID: c1qmMk8XRte5suQKO+UKMA==
X-CSE-MsgGUID: QWM9NlabRH+Wle38Nmr2Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="68552260"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="68552260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 22:26:04 -0700
X-CSE-ConnectionGUID: SmKLI0ptRGC3Uw6SzkHmXA==
X-CSE-MsgGUID: xjJGKl6TT2+OX9+edjPp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130573816"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Apr 2025 22:26:03 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4CKW-000Dji-39;
	Mon, 14 Apr 2025 05:26:00 +0000
Date: Mon, 14 Apr 2025 13:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.15-rc 64/66]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb:
 /soc/power-controller@11d10000: failed to match any schema with compatible:
 ['mediatek,mt7988-topmisc', 'mediatek,mt7988-power-controller']
Message-ID: <202504141345.Y3Bgap1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.15-rc
head:   d866e648717800b6f6395ad36c38f9effcf0498d
commit: da5bb2e3402fa85961294839ce1cb96bc9058128 [64/66] arm64: dts: mediatek: mt7988: drop syscon from topmisc
config: arm64-randconfig-052-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141345.Y3Bgap1s-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141345.Y3Bgap1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141345.Y3Bgap1s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/power-controller@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/power-controller@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' is not one of ['rgmii', 'trgmii']
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c22): leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/power-controller@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/power-controller@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' is not one of ['rgmii', 'trgmii']
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c22): leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
