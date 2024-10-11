Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70C19CC10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677738; cv=none; b=b3YJCKoohY80hdOWa3f3OtLhSycbBagbZi7qWxrQYMInR9HlMGYnWt2w6/9fn7QjWxK65em5yf3j37UgUXiN/9/z/wirWmjxH2UiSo1EQvQv8T0FuVp7qV1phiUGss4DuTM8IAB6/7KKayOskSahIwZFJTdPy32QHY/WyrEJeW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677738; c=relaxed/simple;
	bh=tJVKnyy7eATYzVshaNKNFiz+epJaJ0g9AF/nA3lOxFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6NpcqM3vhJ9pMJKJGK6c26AuUAZl7VMNtnhi97/jiw5nS4Qu9DZ7zGuPPK3lBmFsxBqyM4LJTms0Rg1i6ZgNb2rPyHkGcjn4CIGyrAPlxIFVGgOFbb4f9vOHimAtQ9vN+iBUfeZ9w6/A1gqz2LTC9XkOM1g5654+XOslsapweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5cEaVwk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5cEaVwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728677737; x=1760213737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJVKnyy7eATYzVshaNKNFiz+epJaJ0g9AF/nA3lOxFU=;
  b=R5cEaVwkz6XKSga98VuKOySnhSwUvJB636TkxiWXGTSJOnkPYnyWoKs9
   JAihFyslgiipYf+haFTlKTAQIkK3yhSm6cHzFolA/qCK5lJrGszE5C+IG
   GsCRT8/ms/PrYBHoL9Yv7s2yiulPk8soakMCmiIKvB5b2Z9HU5uOwM2fl
   oWk0UKlFrIx64bwv/PoEag3SgWy3wJxld4rWiF6Onk9+EGN3pRO0gRdjG
   19gaKtvnyQOUCE0CI5F4GNlcazXWvpgRUVyJpM/vUIdyJ0SfZgZ9oDHsT
   BpXeONtCJVYME/5BMr1PZ1umxGdLIxHy2SjicSQZUkUpDgUT4pGCC30jc
   Q==;
X-CSE-ConnectionGUID: CLtWe+1KSBWw/9UxHS4qNQ==
X-CSE-MsgGUID: YB7SofgKTnu9r77dkkeEtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27568318"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="27568318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 13:15:36 -0700
X-CSE-ConnectionGUID: ldDa5H0OQrGr1brkhYjnhA==
X-CSE-MsgGUID: /tdjyiioQiClVNMRgW5RhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76643344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2024 13:15:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szM2u-000Chz-1f;
	Fri, 11 Oct 2024 20:15:32 +0000
Date: Sat, 12 Oct 2024 04:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [linux-next:master 2483/4143]
 arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000:
 clocks: [[2, 15]] is too short
Message-ID: <202410120447.kkIqPEEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 3844f0a2c60b57a986e317362d254089f5d51203 [2483/4143] ARM: dts: mediatek: mt7623: fix IR nodename
config: arm-randconfig-052-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120447.kkIqPEEC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120447.kkIqPEEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120447.kkIqPEEC-lkp@intel.com/

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
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ir-receiver@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
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
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ir-receiver@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ir-receiver@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
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
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ir-receiver@10013000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
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
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000: clocks: [[2, 15]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000: clock-names: ['clk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ir-receiver@10013000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
   	'mediatek,mt8173-efuse' was expected
   	'mediatek,efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
