Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908A913E02A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744560457; cv=none; b=b8SUGnUPXXjZoKgcth6zbV3VZdZ6MAlTDp53XDBa0etB0ZhCdhBjEkoTDfRQ2LdPN3+ZfBtYz97rzZ1uHkS11xOmoKsFWRSAr0lofSxTkJaEdPBspnHSWaW1mNSBy+ZVPqly4sRBB5EdXDujd7BAIYoyMAtEoD33pEqq9ou2En0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744560457; c=relaxed/simple;
	bh=PInz/nSj/hNUqBbvHNnr8/cMTwIura1EVkDN9fPqGZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TV+DRRA5a3Y87xbdBwg4vJxGWRPdye/TnBXdFy78sg6bser698tG5UfNlMsLjFiqNlpPRm9wTVyuz3LTojI3n7XfPpJCMsmVBA+NYjnyc8IJj9LT3YfakB11jq15gmwVLOhEYpwHtzqckqQcUzvlXvRcREib+qmLQBqvOrY59aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwLD89eR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwLD89eR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744560455; x=1776096455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PInz/nSj/hNUqBbvHNnr8/cMTwIura1EVkDN9fPqGZ4=;
  b=ZwLD89eRGd/u2m5T11h6l6wmeUB+AXJfp1zsdGr030LZXJSvuN3eRXPt
   HHL7183rZfJXLMKplFO2zrM6q73SewQ6BPxSMR9To0bOB+3NH7lLdH5Mx
   k3j1N02TTnBw1oTnPgj3aaZDUB/A9mw9UOtFa42VNpHGszIq4l/ehIYs8
   /my/xDktn3g9Etl0oPTEMpJyJrUz7t7j4yNS/Vp6OnlF5ysDgfZTILEOx
   uCA645vGKLaBdIdKl9m4C0oYqXnazqxFmQHsRpRfTzgKoxEE81Jv3vhTq
   WSMDPixWdZGeS/dxtsQnrObHU4ECLg0qeFPEEoGcdwXsH1AEFOkFIPoci
   A==;
X-CSE-ConnectionGUID: b5tanp56TBeZgcmwoTQ+DA==
X-CSE-MsgGUID: pQFon/V6SoaahqCzvG4hKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45173248"
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="45173248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 09:07:34 -0700
X-CSE-ConnectionGUID: AY0gMiOGT6WQ5NKab2W+ow==
X-CSE-MsgGUID: FU0qoE+KTFG1/3leo4F0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="134595549"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Apr 2025 09:07:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3zrm-000CkS-0D;
	Sun, 13 Apr 2025 16:07:30 +0000
Date: Mon, 14 Apr 2025 00:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6624/6651]
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb:
 /soc/mmc@11230000/card@0/block: failed to match any schema with compatible:
 ['block-device']
Message-ID: <202504140008.rhzti4CT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: c089a5b0ac11a162652a5482f13ba08cf71d903f [6624/6651] OpenWrt overlays for BPi-R3
config: arm64-randconfig-051-20250413 (https://download.01.org/0day-ci/archive/20250414/202504140008.rhzti4CT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140008.rhzti4CT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140008.rhzti4CT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: /soc/mmc@11230000/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: switch@31 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: chosen: 'rootdisk-emmc', 'rootdisk-spim-nand' do not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: /soc/mmc@11230000/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: switch@31 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: chosen: 'rootdisk-emmc', 'rootdisk-nor' do not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: /soc/mmc@11230000/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: switch@31 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: chosen: 'rootdisk-sd', 'rootdisk-spim-nand' do not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: /soc/mmc@11230000/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: switch@31 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: chosen: 'rootdisk-nor', 'rootdisk-sd' do not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
