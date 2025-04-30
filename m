Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF620C472
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007304; cv=none; b=s63IZerhyOxlYK46bOqCGsQKipYBgLPrURBqcMkPQgmWYpHIVHp62vYbtD/AOaQsOu+CBHgp6E7AgcOSV1N9Rog8ryQ0GwClpTiY0hbtVPinxF8JSh/d/JoitUvo993Z7L9n2ooccGuXEudIzF4X57TmglXOHWE49My4uoyfYrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007304; c=relaxed/simple;
	bh=zbQvG1UOZb1VoIdKrB7cIXsdT6mieiPoIJZAx4vzKPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGbpx2xIg9XeMvmYKfufSSjhcgHBjegv/fnAUABC0AKzhP2bg6Irk0yqZ01HQH/7zEHt3h7JpY17Qnf9Uhm72YVq3HjOvnH2YeluKFAotN3Oksfr7+f0YY+s1joKxYaXY4Qfu+nfG6ZyKmUIBwdHh2W1zB0FggRcbCYnQMAxWVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqlcRipb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqlcRipb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746007301; x=1777543301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbQvG1UOZb1VoIdKrB7cIXsdT6mieiPoIJZAx4vzKPE=;
  b=iqlcRipbkeNHjx1pdJOH7i6VLRZ8Sr+fpltBdAIN+HE00s+DpGc/l0ei
   Bhit5qBTALq8Xu1x8ia98WimAR46zOHEpr3SFOmcsq5pxPiJ0Jw69iWm9
   0w99UNI9OUcKWcB9zMobcRqbx6y/EVJALo3Omh29abLE770wbkYC9Nk/c
   6/N4Oi4OwOe22rz6zCW6cU7WDr3wWRMyWDdbW6aWaWOT0z1d6jSIXhtm1
   wpfrkNgMFcEZpermdtlF+TefIUz4fABwl0M+3us93GG4j7LCbmN3HwUlJ
   RUfxT4S8CHp80XBc000svWIzKoA80jjUT9SDQyDzU+Ipw9n/orKgZIeSB
   A==;
X-CSE-ConnectionGUID: 8CUnzrZ/S9OVK+SVmMNijw==
X-CSE-MsgGUID: ajJPaDNPRSOKaYZX4YzMRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47541661"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47541661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 03:01:40 -0700
X-CSE-ConnectionGUID: UbJ0uxbVQAKRUb8MNXDrqw==
X-CSE-MsgGUID: 7VR9IXwMT++CHTFTSI3wzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="171320811"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2025 03:01:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA4G0-0003Mz-1j;
	Wed, 30 Apr 2025 10:01:36 +0000
Date: Wed, 30 Apr 2025 18:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2824000
 (microchip,sama7d65-flexcom): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202504301702.MLb1mc9f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   89516ae83e6b7032f6793992ae9ea770ca1a7e71
commit: afd0fa0834ab7def410d2f92cda9464000fdf1e1 [1/1] ARM: dts: microchip: sama7d65: Add flexcom 10 node
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250430/202504301702.MLb1mc9f-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301702.MLb1mc9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301702.MLb1mc9f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,sama7d65-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: serial@200 (microchip,sama7d65-usart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2020000/serial@200: failed to match any schema with compatible: ['microchip,sama7d65-usart', 'atmel,at91sam9260-usart']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2824000 (microchip,sama7d65-flexcom): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom'] is too long
   	'atmel,sama5d2-flexcom' was expected
   	'microchip,sam9x7-flexcom' was expected
   	'microchip,sama7g5-flexcom' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2824000: failed to match any schema with compatible: ['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
