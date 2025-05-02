Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E70942A87
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746209071; cv=none; b=eIRsASfgGoMn+NIb+Qt3mRzL6ThxVCMIXYF4dN4MON04TRFawDwD3XAmo5P5WUbMLMgpqCt+RPuhsle1/VnwDW9VKFYYV/U9SIDvXq19mB7JfyubNC4jnaweGkpLSyy4UXwYtXDu6KZaigcTEAKjLDhdIiqtwEDju54Vr9vN9oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746209071; c=relaxed/simple;
	bh=KyJCE0HvYmuq35R22GskaZxKD+ZEOpBfXmjerpO71Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRmzGpexHBDScjg8p6q1Ynu5OcpCXsMdxPI07u3W4w0U2+P2QSMgCzjiOubb6xSCgveY2sK82ToBHe3HyMIxjhXoCYjyes84a0sEYUB284ApSygYgoAiNTHKnZPVripqLL02ajowVTQvWjVnZvSz08t/aHc4oACvUHc2zqOXJcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FH8SvCoS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FH8SvCoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746209069; x=1777745069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyJCE0HvYmuq35R22GskaZxKD+ZEOpBfXmjerpO71Mo=;
  b=FH8SvCoSlyle6ULuNuJuarWv04vDqA0q5p8hNpBNPcT59FXhJDwideVU
   UEkZMtKCw64VGhu7i1wsCMhKrXou78ikc61AMOUB+BO2xNs9JZwe3ABXI
   FahjS2ffKhfQvfVE7Br+PDB1r3IzbCvWuP6li5YmxFRWPSosxwGF/kYBm
   e8cAaS3qzhQUevibbDvB9S8AAl1J3Hs7MZELjyeuEcLB1rznPihe+MZa2
   E4QErQbWSdnZBFCToQDRFyXkpI9oYnksnH+tSwF38fYMaFJSb48XaOgpS
   xp2gBdsigPW9c5fuSZZjvGbpXFhHK07ih+Jzo44+U/2Ty5gpPuBdpFHNv
   g==;
X-CSE-ConnectionGUID: moCQEsDJTky1wufgqbv8IQ==
X-CSE-MsgGUID: seC6UoE5R1KZpzSq58y/kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47908295"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="47908295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 11:04:28 -0700
X-CSE-ConnectionGUID: b8h1UIEOSxilT6qRYInVQA==
X-CSE-MsgGUID: f9KaeD0sRlqB0uMN/+LBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="135198675"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 May 2025 11:04:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAukI-0004w9-2C;
	Fri, 02 May 2025 18:04:22 +0000
Date: Sat, 3 May 2025 02:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 5929/7938]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/sram@e0000800:
 failed to match any schema with compatible: ['microchip,sama7d65-securam',
 'atmel,sama5d2-securam', 'mmio-sram']
Message-ID: <202505030208.NOP0HEse-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
commit: a92e84f96dc68f5380a8ce8399ad316dd4417f28 [5929/7938] ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
config: arm-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250503/202505030208.NOP0HEse-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030208.NOP0HEse-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030208.NOP0HEse-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/sram@e0000800: failed to match any schema with compatible: ['microchip,sama7d65-securam', 'atmel,sama5d2-securam', 'mmio-sram']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/security-module@e0004000: failed to match any schema with compatible: ['microchip,sama7d65-secumod', 'atmel,sama5d2-secumod', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/security-module@e0004000: failed to match any schema with compatible: ['microchip,sama7d65-secumod', 'atmel,sama5d2-secumod', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: sfr@e0008000 (microchip,sama7d65-sfrbu): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: sfr@e0008000 (microchip,sama7d65-sfrbu): compatible: ['microchip,sama7d65-sfrbu', 'atmel,sama5d2-sfrbu', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt'] is too long
--
   	'microchip,sama7d65-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,sama7d65-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2024000/serial@200: failed to match any schema with compatible: ['microchip,sama7d65-usart', 'atmel,at91sam9260-usart']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
