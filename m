Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2017BCE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743232796; cv=none; b=PD+NRJSG8feTP+4Y1bjmH83+3+ppZjoVdWeinwZXg1V70TOs11OOQYjRtONz+NWUepuHSps+k8seYzg10BtdC+rbWllLcLW9kvVXy0ZIMsycPU4IEs5oTchlu6HErSZBjc1lbT/BfL5aV3N2VfgGxEAYmZniKL7W/9SL60sVBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743232796; c=relaxed/simple;
	bh=acz5zNgJPG6u9pSWs2BhWJPnqIIDdyLTc1B/5cd7j/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqxUzqtnVq9qSk6zLwLNenWY2Y7DThAwo/4TubByJhYeAVt+rp8qoW7U34yHiLq2n7AHULoA5AKtZWsjUQZ7L0AU4HHIzBbsWNqcGdXRCrPZn2v4OLXiUMD3gYzJsUKJ5O8RcZ1eRhp+0ag8twj24KRkpuoljXUQISuDv97VP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQts6BRg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQts6BRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743232794; x=1774768794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acz5zNgJPG6u9pSWs2BhWJPnqIIDdyLTc1B/5cd7j/4=;
  b=IQts6BRgUfFXfozMZK3ryjOUKcB0tD5J3+sASBsCvOrokhzYxHjXUQFJ
   cwfp0SE6iYrdHu86n1w3Og92qSLkwIHs44NrUgfNXQ2w5V2/RpN3a49jP
   S9VAak9JWApwFJDKjnRYTJg3xAiDNje3HWo4hgdWmDd5xWZQP+QcdSWkB
   udCykT0AqSSZxRIHMs9iHDcRIVcMsf8LJHQe2d4yUbU4k1oHiyCfVykFr
   pYwEaud9ZuGnMqG9SL03gbFMnETcYKV2itwBFPJKmUdt4begqvdZKAR7p
   hfdhLK9xt8QHoDfzk8vsf8WjehftVaS6tJ8w7KVUqg19FIjxK9l7xWLXF
   w==;
X-CSE-ConnectionGUID: MH/Vhbf9Tf6DGRX7tpVKDg==
X-CSE-MsgGUID: 7bdelAzUSqaQ/bwynp46Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="43752915"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="43752915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 00:19:53 -0700
X-CSE-ConnectionGUID: YrLnXYwRTjyvSiyhguBazA==
X-CSE-MsgGUID: 19uR5jexSTmXxoPMQr7t2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="125637278"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2025 00:19:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyQTu-0007y6-0g;
	Sat, 29 Mar 2025 07:19:50 +0000
Date: Sat, 29 Mar 2025 15:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rsslro2 37/58]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /: memory:
 False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
Message-ID: <202503291553.Q77BY6G8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-rsslro2
head:   9b73048865d89da6f43aff7b0b3b5ed838ce3160
commit: dc898fe7e5e4196b3f39ff8783ba22a6ab05e2d8 [37/58] arm64: dts: update bpi-r4.dtsi to actual state
config: arm64-randconfig-051-20250326 (https://download.01.org/0day-ci/archive/20250329/202503291553.Q77BY6G8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291553.Q77BY6G8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291553.Q77BY6G8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:671.24-692.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:704.19-726.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:33.9-35.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:671.24-692.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:704.19-726.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:787.27-952.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /: memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /: memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: cci: compatible:0: 'mediatek,mt7988-cci' is not one of ['mediatek,mt8183-cci', 'mediatek,mt8186-cci']
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: cci: compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /cci: failed to match any schema with compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: opp_table_cci: $nodename:0: 'opp_table_cci' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: opp_table_cci: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pinctrl@1001f000: compatible: ['mediatek,mt7988-pinctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pinctrl@1001f000: reg: [[0, 268562432, 0, 4096], [0, 297861120, 0, 4096], [0, 298844160, 0, 4096], [0, 298975232, 0, 4096], [0, 299892736, 0, 4096], [0, 300941312, 0, 4096], [0, 268480512, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10080000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10081000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: eeprom@57: Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: spi_nand@0: Unevaluated properties are not allowed ('partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000: volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000: volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000: Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: switch@15020000: ports:port@6:phy-mode:0: 'internal' is not one of ['rgmii', 'trgmii']
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: switch@15020000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@0: leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@1: leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@2: leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@3: leds: 'gsw-phy3-led0@0', 'gsw-phy3-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: gpio-keys: 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
