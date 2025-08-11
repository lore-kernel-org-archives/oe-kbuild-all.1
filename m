Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519EB8F7D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 04:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754886553; cv=none; b=tQu4Nkz2VHaZ59uEXqOwCPPxxdoIadkMeeHz4pSmuqVynau8KHMR14uABjZ+31EietjZedzvDsccfZhF0bKBluM6Qp0jbBO6H/JmVs+vt2GFPd6AtPra3FHrRRfAi4G/Lzv+pXMciNXCKTbk5Ud4+gXvgbZHLjepwygZJNZTqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754886553; c=relaxed/simple;
	bh=wpYmw7igo8IC9hNMiOpzXkoiySKDmfsh9pwIV/xvGBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPrnKjnHMgLgfngWxHRfIzTKVBqrq8uI4sb8W2UdZ1R2bfGjbB+uSuuZtIEhMpHlRr0rxNRImtYxFOteGhJnSd+IXc+rtaPpEcf/EAwaqa0KpY2rwn3j86A+HgegHP2cK/fYILv4kqsgVWDdmwq3GaAhtVsLmGLVpmCQzfWj1bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOap0alA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOap0alA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754886551; x=1786422551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wpYmw7igo8IC9hNMiOpzXkoiySKDmfsh9pwIV/xvGBE=;
  b=HOap0alAhMrkp0d7nO0lNGUyvuVlPwsF5abYANUU+4LGih7zBbvsI3bt
   YQhkXWusAlaS5CzYZMiVgDhyMqz2ILA8u2JdQoIuEjRIxIr+XgGYhTxXn
   5+YKKfoOhWdNoP/ck/UHzhQTBCRmovQSsi4gZE5zJ9o49B8A7XTpr4izD
   JNMLucEmUTUtTWWQu3+TJFnNDjHGvr7UUduKe0NWdfmRm3Xu8gHKKZYVj
   s99tlkSo0g+CxlAbg4EvRVvN64IEO6sOIdpbMqs2DTaRK5ICmM/mOkyOm
   LYjBh67hzQMQoGBZMiW684R1MxCwi3ozXeRKW+WvdvyyHXB5+6wOSj8G7
   w==;
X-CSE-ConnectionGUID: J/VhwZs6SxWbh1xvhxtHWA==
X-CSE-MsgGUID: bb/dD1QAT0CyXv38E+9PJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67839129"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67839129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 21:29:10 -0700
X-CSE-ConnectionGUID: 830TeT24RxSWNlh4yrcexw==
X-CSE-MsgGUID: OblqLX7PQ12xdJT1ssGx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166124058"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Aug 2025 21:29:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulK9j-0005Xk-0D;
	Mon, 11 Aug 2025 04:29:07 +0000
Date: Mon, 11 Aug 2025 12:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 71/71]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb:
 partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv:nvmem-layout:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202508111219.x5XaT3uj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   55b0b4dead4e07f3273e0ada67d402f9c1c68827
commit: 55b0b4dead4e07f3273e0ada67d402f9c1c68827 [71/71] dts: r4pro: change to same nand-layout like r4
config: arm64-randconfig-051-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111219.x5XaT3uj-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111219.x5XaT3uj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111219.x5XaT3uj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: i2c-switch@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: eeprom@51 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: spi_nand@0 (spi-nand): $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: spi_nand@0 (spi-nand): Unevaluated properties are not allowed ('partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/spi@11007000/spi_nand@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: mt7996@0,0:compatible: ['mediatek,mt76'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: mt7996@0,0 (mediatek,mt76): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
