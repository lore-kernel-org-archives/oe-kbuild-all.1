Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017B4690
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746146062; cv=none; b=KoUeJDZNySCc9BR2IbbyaMjc1fA6T+zcOwVFB0OO6V5mssdx4AKFgCnMC5JssY0h4PElH91xlOcy9pSl/60LiHHvaYFSribohmXiIML/YBwaEjURHG0OvLU/xvV2/Jy7m1JgVtHFHl1LAjxbiyhXfpEk0p5/nNzP5hEq7JqeC5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746146062; c=relaxed/simple;
	bh=0TsvS3nFQ9VF85/MwOV+deLAXJQmcPy1gmlo11mow2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NC8MqFl3LretMEnNjUXsx3cotHL6j/eOc7TdqcV6D6G6H60n1+LnQddbOIHI0sI+rjsBpCmPKYQT7EOc2ykiJxj22zpRol1PolL3iGe58aLYaBjDx0gBLNzAUJPiQnjbPvjyWymDo5MguFqIXAHskBFdZ1+jpjMogy9SeVgvsHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ky5zmpLU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ky5zmpLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746146061; x=1777682061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TsvS3nFQ9VF85/MwOV+deLAXJQmcPy1gmlo11mow2c=;
  b=Ky5zmpLUZBvFa+60X9xBkMKjyKXlAA+VowWTK1ql7REtUvbK4WEqwV4N
   UVnQyU0EXxTt+ySdHWd96YqtnUcTL1A924el/zuhy0npV7es+mVZcQGKs
   PrMer6jVVzgW0WQPoswFAwCaeMrpfv9Tpv+R9Ua7qa3w7cCL14FTcvZse
   aR7rBBIsQqj1JDnonsBZ7kXbe37uXMmelfwsogTF0u3QfrlNHsSJG/ndQ
   d/jaRXbwyDWsLYZIqrU6pqXGTCMNHM3/z2BlIcDt3NVor5UVS4zPJPSzR
   fJs7MBrak9in+k3RzX0EiWZLLatb4QOzEweaaDgyXHV79usuyfFl6sW8X
   Q==;
X-CSE-ConnectionGUID: FD8OD7MdQGWVD4IUQDNI9A==
X-CSE-MsgGUID: SIhSHMfbS1Wfsu6k8YSy4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51642218"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="51642218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 17:34:18 -0700
X-CSE-ConnectionGUID: 5kQLSlRgSgCSDgVukgxg6w==
X-CSE-MsgGUID: pEDCXobhQlmvzoT718/rwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134264001"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 May 2025 17:34:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAeM2-0004TN-0V;
	Fri, 02 May 2025 00:34:14 +0000
Date: Fri, 2 May 2025 08:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 dma-controller@e1200000 (microchip,sama7d65-dma): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202505020815.5EGGzXu5-lkp@intel.com>
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
commit: 094002ce2768893efc4b1ccb62eaf645f72d115d [1/1] ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250502/202505020815.5EGGzXu5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020815.5EGGzXu5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020815.5EGGzXu5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1200000 (microchip,sama7d65-dma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1200000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1610000 (microchip,sama7d65-dma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1610000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1614000 (microchip,sama7d65-dma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1614000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
