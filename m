Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF381720
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741451113; cv=none; b=YT5HRIS6kCVR4BDUZ8LoMRY/30IRralWBrQZWPq8UUVflr91jcdqD/iuHWKI560DV0jlpavpY+oF0ITmQv8UksGzVGUG96gayaLOfubaMeJ5dmZ2Y/H+gTab+hhzAVmpYT1ULlQNUtoSzFcuDpWlDm8AgUmYkT0GdmTKQNN6QPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741451113; c=relaxed/simple;
	bh=SIvfBL/FPvmh/G2ooWhosQApwoc8VveKnkHFZ0/If9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mp4jOA95uId5DljEdaRy/wYXSffhzcu0gkFBhgBoU8Flasr0yvWK6JvCr+IefEW8I/YC15CZTigjD5rRypb35qLPNx0AV/Au/EVcDsNX2PGZT39RvJ08AkN0Nkv65NHzot3e7w8TK9Pmm72qjQar/zAIj0gtCIeZEuHYV3OxNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/6dkxHO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/6dkxHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741451112; x=1772987112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIvfBL/FPvmh/G2ooWhosQApwoc8VveKnkHFZ0/If9Y=;
  b=B/6dkxHOi26jXJr0YD9kEq0V2Z5Sru5BaGOrk36UnpZF/8n3SVgUdpys
   Ldel5xgW/f+85c9Sn8sIsVlfxTdh8c74RvnFOF0hiZymwsBNMqTDLE6mO
   hcWnICqOEfrCLXdoovP6C8sg/hc2aedMHQQzWg/C8mhBt4d9URGr+SY6b
   IOLE2pwDTFgZLrlHvIrWq9ldHECkrFWmLG8XX2UuIV05gqYsSsAj65AaQ
   zEhzetYwcM2jGglURfLzBcmlEOZVFtyVdRE4/sS+bdLxH9FHez5A7X98X
   aEYEqN23I3Ps65IqFQoBSA7N4HWvbhw/iYydQ8MooQD/LiaInDXZcA7/y
   A==;
X-CSE-ConnectionGUID: MVMh8NTsTlmjU7hdikqNow==
X-CSE-MsgGUID: mQMDjVwrSoSyF4FxXs0BYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42528103"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42528103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 08:25:11 -0800
X-CSE-ConnectionGUID: QLMrxkV/QUCMS6CUsA50Lw==
X-CSE-MsgGUID: m3azZOj8QXy85dHwRpxZbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119402935"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 08 Mar 2025 08:25:09 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqwz5-00024K-1G;
	Sat, 08 Mar 2025 16:25:07 +0000
Date: Sun, 9 Mar 2025 00:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 6680/9634]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: rtc@e001d800:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503090007.j8Bui8IA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 3e2b7addb6c608fcdcaaf463d8ce35b65da10d5c [6680/9634] ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
config: arm-randconfig-052-20250304 (https://download.01.org/0day-ci/archive/20250309/202503090007.j8Bui8IA-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090007.j8Bui8IA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090007.j8Bui8IA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/reset-controller@e001d100: failed to match any schema with compatible: ['microchip,sama7d65-rstc', 'microchip,sama7g5-rstc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: poweroff@e001d200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-shdwc', 'microchip,sama7g5-shdwc', 'syscon'] is too long
   	'microchip,sama7g5-shdwc' was expected
   	'microchip,sama7d65-shdwc' is not one of ['atmel,sama5d2-shdwc', 'microchip,sam9x60-shdwc']
   	'microchip,sam9x7-shdwc' was expected
   	'syscon' was expected
   	'microchip,sam9x60-shdwc' was expected
   	from schema $id: http://devicetree.org/schemas/power/reset/atmel,sama5d2-shdwc.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/poweroff@e001d200: failed to match any schema with compatible: ['microchip,sama7d65-shdwc', 'microchip,sama7g5-shdwc', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: rtc@e001d800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-rtc', 'microchip,sam9x60-rtc'] is too long
   	'microchip,sama7d65-rtc' is not one of ['atmel,at91rm9200-rtc', 'atmel,at91sam9x5-rtc', 'atmel,sama5d4-rtc', 'atmel,sama5d2-rtc', 'microchip,sam9x60-rtc', 'microchip,sama7g5-rtc']
   	'microchip,sam9x7-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/atmel,at91rm9200-rtc.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/rtc@e001d800: failed to match any schema with compatible: ['microchip,sama7d65-rtc', 'microchip,sam9x60-rtc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1200000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1200000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1200000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
