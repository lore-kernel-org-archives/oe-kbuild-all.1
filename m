Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA218FDA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898103; cv=none; b=JjtYMxuA0r6zq1Lb4o2J/HC1HYiZOrCRqgszobFbAwP7r/c7Locb9ed3C8moI3O8pz/vrI7YDBgRzICF3gklgbC95sXKL8SLv8pThmJdGBhJ3lGFXKz3+DE/Z5gZB9PvIUli/klMMSorAeYArdstX59eotaLTsGmxAUgBU4Fhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898103; c=relaxed/simple;
	bh=fSGaGQXPQbii+WVW4qZ6pQA0lmjgprQbOEV+uQw/rNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MGtVnTQkhok7SHBVsR+7jzkzXrzCAy0oiF1bqwHeKlY+ZJ6n3i/t+c7k50f7lj+VkDfdc/ZDHPp9c7wgF4+4PrdHWUVPjn1spblWqLb1RYCU+IMhOwrsJbtfQ82KOl/uoirQcjboNVXpStvCuEvlpUUY/j1cL7LVk2Xoe9seL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/0aiVbR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/0aiVbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734898102; x=1766434102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSGaGQXPQbii+WVW4qZ6pQA0lmjgprQbOEV+uQw/rNQ=;
  b=L/0aiVbRb27fz0scm/d91M0B1Jngkr0qoOjMsZgoc5zBhafrmIwtoVDb
   QWflhgH1tDe7DYv33RoFKRC5jGCni+AKJmzIX8QDQ4N5srGjetTGuPkMc
   qkOawHyF9U8//mfO1zmiejwYgDANXAGsLbmjvqCWOM9+mGM4HuzyTxH0t
   vEy+HNKRFy7WUMLxxMtoWBagZsF2BNwU6oygtgqF2LvjR7eV7cyKBhqQJ
   hw1cipFqfQCKDpLpiF1ZXrCe2jiTXNbnkUSLUD3XvCiSTrZDk1xjoN6NB
   ILSH97kLV+nFcZbDs/HCoj/S8CtdABLIk9tJMciF7AQMdXB878C/m7hRk
   Q==;
X-CSE-ConnectionGUID: 52P/7xgDRkSMV0CNV8YzdQ==
X-CSE-MsgGUID: 5tyBKGgER6Ot/GKbV5Qesw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="52777087"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="52777087"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 12:08:22 -0800
X-CSE-ConnectionGUID: ExfGMzq/R7WoSiyEY4AqqQ==
X-CSE-MsgGUID: 86L4NX80SZO57lB53uuo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98871544"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2024 12:08:20 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPSFO-00038l-1M;
	Sun, 22 Dec 2024 20:08:18 +0000
Date: Mon, 23 Dec 2024 04:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 73/85]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0:
 Unevaluated properties are not allowed ('#address-cells', '#size-cells',
 'partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
Message-ID: <202412230301.xU25huaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   71039e5e1e5f0b4e55c5f6279c659b58e05819c8
commit: cd4f46fcaca1a45c10de67b44266921f25741a61 [73/85] arm64: dts: mediatek: mt7988a-bpi-r4: fix trace for spi-nand
config: arm64-randconfig-052-20241222 (https://download.01.org/0day-ci/archive/20241223/202412230301.xU25huaS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230301.xU25huaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230301.xU25huaS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11007000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000: volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000: volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
