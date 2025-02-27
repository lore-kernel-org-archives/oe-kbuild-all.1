Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E025D911
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684572; cv=none; b=PcSgzgZ4prpApqMDNfHv/B5uA+QRHdq20U1DbThCVywCwr4BkOhwZvTieiqjdedR4fdeg0Jc5KVArc910ZA98HF4Y/mEQnQDy6l37UiyV3JyZKbZJZvf0PCsJnCfLcqfIMu+Xidlo1Bo0PsL5N82hTqc+VVyDGXYWTWMG9RFcAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684572; c=relaxed/simple;
	bh=Bvt95BdrszbNgiCMSYv1BayE2wntJ5DbfRVpHM1eGwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVRMsOuA+OnudDimY45/kxQQq7mBCiJOviEoFiEXAJlsf8iQsWFz22A4eDIefHDzwd3Cd8K8ZWTb2D+2oAT96gQq9jTUiHHpJRyuDnrFIOM/8M4jP0syGj2HcRmCSefygffcaz9k7fbT8E2siwSTncALTnKHKFi3x0wGtpIM5oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3aUWd8z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3aUWd8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740684570; x=1772220570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bvt95BdrszbNgiCMSYv1BayE2wntJ5DbfRVpHM1eGwg=;
  b=K3aUWd8z7H4AB6x6cwI0zr0dwo/PCqhJ2odQML63T3e7I5GspSN1PNgW
   iBK+IYVNoqJY0MA1C9Y+bGZGPetfWqmuR9D5jrMFRkiBg6PweMaz4tvQT
   KTD/sLSJXfXmllaGX2FC1XkoxSQwS9iT6zL72QbWqcR5VU6dePIalEZ/C
   UQjjVhc6lrYpNmdAgVbt+E7SyrR1gnyk5x+KsdgPBGj7TLsnjLkFLRhdt
   ndwLVOXbC5Y+x/roLZLfix083onv350gNDupWId2bA7Z++sdrLTrUp6v5
   GEnBC9GrzFpispB7XBi8lD69jCafGuf+LPKR/yKOzjVx92+t5xKQOuI0Y
   A==;
X-CSE-ConnectionGUID: hScJVQZYTeqm6LbTS4mN+Q==
X-CSE-MsgGUID: ZFSTvrCaSkSzbKIXuNmpAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45244923"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45244923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 11:29:30 -0800
X-CSE-ConnectionGUID: DnjC9vREQwCSKLxnYHPqxQ==
X-CSE-MsgGUID: 43bmVcXUQsq3+lH5wmg6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117115877"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2025 11:29:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnjZW-000DwW-1P;
	Thu, 27 Feb 2025 19:29:26 +0000
Date: Fri, 28 Feb 2025 03:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 5341/6583]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 dma-controller@e1200000: compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202502280334.b95KXhoC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: 094002ce2768893efc4b1ccb62eaf645f72d115d [5341/6583] ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
config: arm-randconfig-052-20250225 (https://download.01.org/0day-ci/archive/20250228/202502280334.b95KXhoC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280334.b95KXhoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280334.b95KXhoC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1200000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1200000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1610000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1610000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1614000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1614000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom'] is too long
   	'atmel,sama5d2-flexcom' was expected
   	'microchip,sam9x7-flexcom' was expected
   	'microchip,sama7g5-flexcom' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
