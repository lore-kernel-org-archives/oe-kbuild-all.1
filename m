Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AD63B9D87
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147884; cv=none; b=EnjYDo5lQWOcelvtlXMO/xqRG8gZkAVSP5ckucrThySz8k4WaWiErmyQyO9HNB9WRvPKQaNJXZPr7Q+42ereLC4YvBAwwk9Slr2cHnQeDW5riqVcB8zoWyS5KANBAmQCHMvATymsBv6vkFeqWWoxZESFhGB+hPeVhq9aDmJBwQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147884; c=relaxed/simple;
	bh=HfCcUwuiWRVqyFT6kyAaQazd+Ozue4dY5XU6LM0bc5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lysZ+hDFLtN74unbPS3uoWUioEsikYSO5cLv+jJLCMMIjNonO5bxhsRuegZwQIdEJ57hUQSXh3OO489p4mYYtWvbqeaOEY9W0iwhESQ0SOQBz/GBFswe8BJ9rcZwEEWz6uF8+gTZoDfN1RsJ+1sp+Qn/PcoZjeZOv8/7O1FLbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSL8X3BR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSL8X3BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773147883; x=1804683883;
  h=date:from:to:cc:subject:message-id;
  bh=HfCcUwuiWRVqyFT6kyAaQazd+Ozue4dY5XU6LM0bc5w=;
  b=GSL8X3BRjrAoPmbLLnKwpkdUztU49AbC0QR80B3YhrE6i+TtkDZRx34o
   hpoUSaJwHjBn83Kej/FwD8J0xhIECDWosY+SYFtHybbmemaWRB1FgcK/K
   jCVnV6d8uz0cmhW7qeH0FwbFRrNIsAt6jbqDLAjajyyGaekYqw8eNcJr6
   b6OD7IGPYwfRpyK5RiCNs2F/XYOvMixB6MN1Dm1UUFnVTQYrT72PcKtII
   Ss3/jiYPSHK7SIhd3mCpF+qnb8hwXq2qs+kZkaGt8TjR9PgTu9E086Zu/
   Xm7jW84/pSI5k8tlVPYnkCFI7jNpd5rDXhRXEIrC2UAtbchsoIije1NAp
   g==;
X-CSE-ConnectionGUID: 9bSfSntnTIuSU5kK7eRXeA==
X-CSE-MsgGUID: +cN+a9qiRg6F46MXyLeMBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73891827"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73891827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:04:42 -0700
X-CSE-ConnectionGUID: fF1imu1TQlGOTAezhHp6dA==
X-CSE-MsgGUID: igiUFtAHTnGv4VGc3hyUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220059761"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 06:04:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzwlK-0000000034b-0arC;
	Tue, 10 Mar 2026 13:04:38 +0000
Date: Tue, 10 Mar 2026 14:04:01 +0100
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [linux-next:master 2006/4750]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 lvds-controller@e1408000 (microchip,sama7d65-lvds): compatible:0:
 'microchip,sam9x75-lvds' was expected
Message-ID: <202603101313.TBjk7M3G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   343f51842f4ed7143872f3aa116a214a5619a4b9
commit: d83734a0bd253cab38b52065b2e35fa34c2d8770 [2006/4750] ARM: dts: microchip: sama7d65: add LVDS controller
config: arm-randconfig-2052-20260308 (https://download.01.org/0day-ci/archive/20260310/202603101313.TBjk7M3G-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101313.TBjk7M3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101313.TBjk7M3G-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt'] is too long
   	'microchip,sama7d65-wdt' is not one of ['atmel,sama5d4-wdt', 'microchip,sam9x60-wdt', 'microchip,sama7g5-wdt']
   	'microchip,sam9x7-wdt' was expected
   	'microchip,sam9x60-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/watchdog@e001d000: failed to match any schema with compatible: ['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: lvds-controller@e1408000 (microchip,sama7d65-lvds): compatible:0: 'microchip,sam9x75-lvds' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-lvds.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: lvds-controller@e1408000 (microchip,sama7d65-lvds): compatible: ['microchip,sama7d65-lvds', 'microchip,sam9x75-lvds'] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-lvds.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/lvds-controller@e1408000: failed to match any schema with compatible: ['microchip,sama7d65-lvds', 'microchip,sam9x75-lvds']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
