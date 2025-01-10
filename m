Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5C539A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736470826; cv=none; b=FeHxiL1b19b38vy7N47Q4H/JAL6YV900E7Njqc2lKx66hma9Icmp6QSQJjfOXUkT2vGql/zozwOU9x1/02eG12OnKC9mUGDM10cz0FonM439AshJ5a39Pi1qCtFzptynHS2Xij2wjQ2fbe5geq4DSTuFOnWs6buHoHdsaLrZePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736470826; c=relaxed/simple;
	bh=hXQqFxxhjNWBpWcu6OVSgtL6JpOQKw20jgLId9jkvuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5xjWnwg8igSc8OZvKsLaPVIIvZXBHNJP6DAgSbqP/UYkkmtuMviAi9b2wPcGLJx6K07dasoMQ0V6lmbZ1bXmuCaWNsrcUh0JC3ct1OnWuEr2vV3M8aRAbpHeEYgo2vOAKdWUOBpemahO0lEdfBRdtbxvy4n6sjut4c6+7lfSFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGXjMaX6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGXjMaX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736470825; x=1768006825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXQqFxxhjNWBpWcu6OVSgtL6JpOQKw20jgLId9jkvuQ=;
  b=LGXjMaX6HZHQibSCTHANYcx84wXR0hW831WY32dJSIXpp3txJYpINzfc
   OiqQHHm7ceoheWhvR3Hau2aH7ZGqp5p37TCGAjfn8smR1lsfGZj0WG+LO
   8dPSBVjObmsCBsAA2DEGNXtYk2NDgRocvwx1Ra/Cq920NXTPsLxRp23Kp
   UIWI6G9z65Fvto72/dFbp/pupO4Zf/RKSfn3EGNB4fK/5YTtOdh9o33nS
   t6yLmZLjerHH2Dt9gQxIHWNs3dr/cIqnurcp7EY/za0bXPpvypMgd3FdT
   2C/mp/j9YWv6bwj6bYVlLaCLlgcnBjZOGumWHNG1TNJAr0VXFpCgHtJEL
   A==;
X-CSE-ConnectionGUID: WK8Lc4N8SOOXzZB16934Cw==
X-CSE-MsgGUID: 2xjC4FBBQmuUZoLEUjMNqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54299971"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="54299971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 17:00:22 -0800
X-CSE-ConnectionGUID: hGl0oSH4Rb6DsKWqOe1dkg==
X-CSE-MsgGUID: IcP2DE2pStaUPlzfe3DKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104102436"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2025 17:00:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW3Nq-000IM3-26;
	Fri, 10 Jan 2025 01:00:18 +0000
Date: Fri, 10 Jan 2025 09:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Romain Sioen <romain.sioen@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [linux-next:master 6812/7110]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 /soc/pinctrl@e0014000: failed to match any schema with compatible:
 ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
Message-ID: <202501100800.kVvTZiBU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
commit: deaa14ab6b0610d052597c3f6114c3d9f0dc4c6c [6812/7110] ARM: dts: microchip: add support for sama7d65_curiosity board
config: arm-randconfig-052-20250108 (https://download.01.org/0day-ci/archive/20250110/202501100800.kVvTZiBU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100800.kVvTZiBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100800.kVvTZiBU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/clock-controller@e0018000: failed to match any schema with compatible: ['microchip,sama7d65-pmc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: clock-controller@e001d500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-sckc', 'microchip,sam9x60-sckc'] is too long
   	'microchip,sama7d65-sckc' is not one of ['atmel,at91sam9x5-sckc', 'atmel,sama5d3-sckc', 'atmel,sama5d4-sckc', 'microchip,sam9x60-sckc']
   	'microchip,sama7d65-sckc' is not one of ['microchip,sam9x7-sckc', 'microchip,sama7g5-sckc']
   	from schema $id: http://devicetree.org/schemas/clock/atmel,at91sam9x5-sckc.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/clock-controller@e001d500: failed to match any schema with compatible: ['microchip,sama7d65-sckc', 'microchip,sam9x60-sckc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: mmc@e1208000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-sdhci', 'microchip,sam9x60-sdhci'] is too long
   	'microchip,sama7d65-sdhci' is not one of ['atmel,sama5d2-sdhci', 'microchip,sam9x60-sdhci']
   	'microchip,sama7d65-sdhci' is not one of ['microchip,sam9x7-sdhci', 'microchip,sama7g5-sdhci']
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: mmc@e1208000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/mmc@e1208000: failed to match any schema with compatible: ['microchip,sama7d65-sdhci', 'microchip,sam9x60-sdhci']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom'] is too long
   	'atmel,sama5d2-flexcom' was expected
   	'microchip,sam9x7-flexcom' was expected
   	'microchip,sama7g5-flexcom' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2020000: failed to match any schema with compatible: ['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: serial@200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-usart', 'atmel,at91sam9260-usart'] is too long
   	['microchip,sama7d65-usart', 'atmel,at91sam9260-usart'] is too short
   	'microchip,sama7d65-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,sama7d65-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: serial@200: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2020000/serial@200: failed to match any schema with compatible: ['microchip,sama7d65-usart', 'atmel,at91sam9260-usart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
