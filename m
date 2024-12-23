Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BEF38DD6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947558; cv=none; b=AlTwqErQFgOfQKBSlTDrZuIl2138d5mIGyNwoDZhnZ94J8x5r6pP3eIBJEyvNGnS1TyWXINkq5ZXZ3IDQ3GzuClNaUYWT3nMapHBWR/qu5OYyOG/OvNMrfc7zdcdCgfDmPafOFbn3TlAYH0fLslCeKIjEbTro8BVd5IJ5EZaKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947558; c=relaxed/simple;
	bh=hCoA5VMEUFLQesQ+/U9EQC4k/82sXHcfpqRRoXN7+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1BPBxxQSRQ30O355UUgQRAvSiep/h4LUaRhDiKEksTEb+4wdbhNPH2BcW0Yv2MZyD8gufKICRRGnada1ehrgkn0X3F8kVcA1F3sGyQEfPuPEIVkjP7U/E1+fdxDLjby7Ue+FCtn20ts1RMdzV8xn8QosHbzSZMdAIK5wYxHOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9fNnFiP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9fNnFiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734947556; x=1766483556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCoA5VMEUFLQesQ+/U9EQC4k/82sXHcfpqRRoXN7+Zc=;
  b=h9fNnFiPgZukyjw4FQvc1D45brlWOcmVJyKQFgfEcNOjXuctWjwMNckF
   ldgLTgR6jx7WGPD1B1a2jIWlzBEvQZ/1iATgaWmwkFpKbd08Qq32IT3om
   1pem38VlZRAX6hMU6KGg83GwRREZBDjiqaVbieyoyXxDa+Y1xaCLTu3AE
   SW6gzxLxN0tLaq1SHwx/K2WFzxrbGA05q3jMSdhmWc/DpwIdAO7myasKy
   CB702DDPJQmiJlC7qtxMNI0pbjL/Swuv5hTg8YtehuR453oS79VMaCcsV
   oiIyoc3zQz1xhEJvCPwMgNFjXytWsUleRX1QkGhhesozdWg4blE58QEoA
   A==;
X-CSE-ConnectionGUID: PvHTV7XmSVyr8p45iK064Q==
X-CSE-MsgGUID: PjR8H8Y+QsOLUezRKOkLkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="52810645"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="52810645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 01:52:36 -0800
X-CSE-ConnectionGUID: zMWPD7BbROW8K/2GsrC+yg==
X-CSE-MsgGUID: A33lbNMxSUaFbQVOceIMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98935817"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2024 01:52:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPf72-0003Ww-2c;
	Mon, 23 Dec 2024 09:52:32 +0000
Date: Mon, 23 Dec 2024 17:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 73/85]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0:
 Unevaluated properties are not allowed ('#address-cells', '#size-cells',
 'partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
Message-ID: <202412231733.t9hGqzR4-lkp@intel.com>
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
config: arm64-randconfig-052-20241222 (https://download.01.org/0day-ci/archive/20241223/202412231733.t9hGqzR4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412231733.t9hGqzR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412231733.t9hGqzR4-lkp@intel.com/

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
