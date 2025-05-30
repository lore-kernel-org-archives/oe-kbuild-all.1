Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E28C23642E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748629969; cv=none; b=PGUQBoAskNZwJ6Wv1Bt1L+qtoLBZzzibxdIU5HyLCVZKTLTjdqOi6OpRCGiTwBUToYoNoM8cVl2byJITHuaY2fVjonhUJ2s6JE4KEXD9VYaT/7xf/W3jinW3ztfMGLEiZ32OT4ltY351+z4f36176nBoQOpXrLllt03X+Tmhi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748629969; c=relaxed/simple;
	bh=VETUTI/SWs/oyGfjUYQjNesKbGJxQU+nAnoLi9VzL5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/2Y5PfDKY4WAd7CeGK5f36040QGmHYpr1RNf93t+B/pcPMmUn6ZKDxjBOK2jsjZ9tS5wsgkPWtuf9mla04ZQfXcqbvUV7M924eWIzVGIwh/bTQNht2QlSwJGRnFHkCfV+/WFiXtW2fgDY8sqecCK+LwsaisOtGwjbUZKQLDXOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miVJK/lE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miVJK/lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748629968; x=1780165968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VETUTI/SWs/oyGfjUYQjNesKbGJxQU+nAnoLi9VzL5g=;
  b=miVJK/lEG4t/WaynAHrmbY8OYZpa9KJHikiumbMmSNhvuUFxFdnYx5ge
   ibGewSE2fdHa8zzaSpmcOYnzEkiWTQbsoaPloLQ9ST3y2fmqaSPh4d44l
   4j3Z+rvBkwImlkF9iqDuCSQ54OgskCIxKVMoLEQt6RkkjdBKKo+E+of/r
   PKErz7SaEK0OfAsWaYOQwWSJVxISLqsBRL+CMw2eA/vS77oSjuTtB554X
   pMIWPljOOKIztYVQdUlW6Cz7KGtmCQ6c3HDciYarXyFYSi3SFip8e/B/H
   jn71tEVMBSLxUHIq98aj4rpiiIU+DO85Jir9CPqJwddltKE1X1fpRej45
   g==;
X-CSE-ConnectionGUID: opHuhTGkRUCykWD6hGGnsQ==
X-CSE-MsgGUID: mvUPjIzbRPi0RyAclUikzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50739023"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50739023"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:32:48 -0700
X-CSE-ConnectionGUID: nLr9tux1RNegvhQX8iOxpA==
X-CSE-MsgGUID: 2tffWcglRhOXO/CiciUpkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144412802"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 11:32:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL4X6-000XsW-02;
	Fri, 30 May 2025 18:32:44 +0000
Date: Sat, 31 May 2025 02:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.15-rc 47/88]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /
 (bananapi,bpi-r4): memory: 'device_type' is a required property
Message-ID: <202505310207.afJAs7Fb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.15-rc
head:   cc779b8ab7f799ada320315dd27b87b0ad746227
commit: 022164675ed58a7ced026a097389c871df94ba99 [47/88] arm64: dts: update bpi-r4.dtsi to actual state
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310207.afJAs7Fb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310207.afJAs7Fb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310207.afJAs7Fb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: / (bananapi,bpi-r4): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: / (bananapi,bpi-r4): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10080000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10081000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: gpio-keys (gpio-keys): 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: / (bananapi,bpi-r4-2g5): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: / (bananapi,bpi-r4-2g5): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/pcs@10080000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/pcs@10081000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: gpio-keys (gpio-keys): 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
