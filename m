Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44691C6A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 06:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732947035; cv=none; b=jFwi2L76+otY5fftUv0jFJ6RS8mCcTt6k7hoQzTaMqoMyysQzkSUt4QWscmS0JEbfx0n+KC/YIgVOLF1SRGU/PgKSXjr+ieTqw0S/5yYiIePFEbB/kENsjZufhIs8WeqYpfliIV2e981IECqKSy+Jk3S/X+Se0QMu5I3dotYGOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732947035; c=relaxed/simple;
	bh=cVLBXwCMO+gO0OovtM5sTveM87fGg37tDmbFYG9Ext8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U2OCVnYsdLyb0UHfc8grdjE/uRB/DBLsGFrO7CzusND3RBrm3tj9Xbm3Boc+zzMzogmYymsGMzel9MfMuBRCAZOxpZRAkjVXrUoQzIx5d3MItiuFI8uUXAlnkg3kzQ1Nq6w5CdClm0XI7Te2rRqO3R9L07+NrX1CAa5X+MO1mjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nabL/NTg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nabL/NTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732947033; x=1764483033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVLBXwCMO+gO0OovtM5sTveM87fGg37tDmbFYG9Ext8=;
  b=nabL/NTg1rcoN6DPs7ocuhVs8qhyRTeIPSorsVfKc/HaMkpnV9VuVinU
   D65txFGOiGCamjLo9aL9Tqx4lF+Wsmcp004nRhsGPPt+6EXF8MVujjSDj
   BncpfavtwyltbmDCp2bnVQRqVH4PNgnaQEZ1ijP07F8nEwjEhGknprKNM
   xrxIkrQInyx0/OoKk4Jm18eZ7Shk01Rs3oIbSZ9HKGPIL2Ri4uWArJVpe
   qu+AcX1JwcT3QsygypqjABj4I21UtEQXvNsElJFtVJiDYBPQ/gTqqjeUW
   gZ2PmRlWoErqNffh2qEKr+4bLIrzkr28LjcllcocepCLRNwNf+HrxFEZs
   w==;
X-CSE-ConnectionGUID: Ryrf0HXpQRCSJykDa8Y0Bg==
X-CSE-MsgGUID: WhwIHYCITbWC/OAZTctH5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43785018"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="43785018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 22:10:32 -0800
X-CSE-ConnectionGUID: mY3kxJL8TmSz17EnPk4SeQ==
X-CSE-MsgGUID: RpFXe2pZSDicdax4vJo2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93108975"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2024 22:10:31 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHGgX-000083-0d;
	Sat, 30 Nov 2024 06:10:29 +0000
Date: Sat, 30 Nov 2024 14:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 34/35]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /: memory: False
 schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
Message-ID: <202411301453.OTXYrChH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   0394c5dd3789237469301f096d1e011365f926be
commit: ffd16726c46e4e64dab2a85573165f5ce10ae7cc [34/35] WIP: dts: r4: fix some compile errors
config: arm64-randconfig-051-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301453.OTXYrChH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301453.OTXYrChH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301453.OTXYrChH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:33.9-35.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /: memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /: memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
--
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10080000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10081000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: eeprom@57: Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0: Unevaluated properties are not allowed ('partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000: volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000: volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000: Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: reg: [[0, 353370112, 0, 524288], [0, 356515840, 0, 3670016]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:0: 'crypto' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:1: 'fe' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:2: 'gp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:20: 'top_netsys_warp_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:21: 'xgp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:22: 'xgp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:23: 'xgp3' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: Unevaluated properties are not allowed ('mac@2', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: gpio-keys: 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
