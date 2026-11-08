Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100100;
	b=bitcM5VPajtFUQs61fgqeKe5aZNjpt4eRqzkl+7CH4MA25eHlcoRn624yMD4fAavBiYR
	 XAVTK6QIiH2kcY1Fx+w9fhI4DoIr+vISyaqodKp7a5xsjwQhK1r9VYlBLyzP6Ou8vEQNJ
	 62+agLxd9ciLr6Hclm7CUnTMe9mPQqHRajxdiVO44Up72YSzaq74IH6m6mrBk14zBL78D
	 G8OfUKjqkvYVK9RX4wVTSIbnlJ2/1ZJlIKJylysmIGHay1hxwnxcEBc3tisS/yC1Teh8W
	 4LkkZI6A6FzS+di/dqhkovqhzzsto/sgg+i4LMaUiFC4/lsYxM9UG2WhUXcrk7AmI6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100100;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZPJXPSLKyULjlM3dsTxTppTFpev+eq5unlIdoSAOR0Y=;
	b=ZHeLgtN+Bops0m7xEb7PGi82167ZX2W06HcnQ9oOxElE1e5gT+lolrjV5YFwiUYdzcbw
	 ksYXU+LswgcwGqN3e6mAzkH8ZyQ3K8jX0YAxwo2cHWsyZ6rSZTrKAXQHDZy83IvKtCbzV
	 4hXLBRrNp+wdMeI8y4errgjf/z7ohfnvY1pyIVcA6i+Jkr7s/UvkloH5wpfD2tKUES46I
	 N9WbwyyicXF/TJQ28C2zT//KHlGyWhxbaXAP4+9LKANjOTJ7K6MqqbF+syM2UuR+Se8iX
	 wgGMN8zgSBPygv7qHQ+rsdindEB77YJqcXqb98VLklPSYkYTSSXQuCckSJQlNJN5RCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBCkenLk;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D7606A326
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 01:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBCkenLk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794100098; x=1825636098;
  h=date:from:to:cc:subject:message-id;
  bh=SUc6Lg2/kMDiV193jP3KZdYDeZfbzXWdYLSHY4A97wg=;
  b=DBCkenLkzelP7CDXxaG2scvdb69gi3nBdCXB/UO/tuv11qNCF8TC3/QY
   FeoMxyumv6jdOL45qR5gjEykeZTdo6cucsp5kge9PvdEjD8aBz0zOUiO4
   t9mYIfMkNU9C8iBbpDPsqWI+o6TH3TfnAjqOy5fR85yvV3vmvyZk4iua/
   4xyGzKh6CcApbCYg271mijRjpsM+ToUMbES52ok7YTnHCiVLiz424UCXT
   ISXVf7uslv2UtuQhqql9PZtKNrtRyPaLSm1gMf1BZXSpdyviQEKNrq/9d
   e4iNgNHjYbLcmYujMVeya/ggCYR2QvqLFVYdUSLSUUZ5/xTeFkgodS587
   w==;
X-CSE-ConnectionGUID: AfAI0uajSyiuEWeM4zluRA==
X-CSE-MsgGUID: omMivLBtSYOpR4kZDwl8SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2764348"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2764348"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 17:08:18 -0800
X-CSE-ConnectionGUID: a7YtHKA7T+2F6GO9gl13iw==
X-CSE-MsgGUID: WhLKRNtWTSOgr5BjFdAbpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7440622"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2026 17:08:15 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPrOH-00000000Avn-1a4y;
	Sun, 08 Nov 2026 01:08:13 +0000
Date: Sun, 08 Nov 2026 02:07:51 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 Ivan Vecera <ivecera@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3512/4145]
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb:
 timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the
 regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
Message-ID: <202611080203.OxBIUHI3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
commit: 17c58242988d2b4363fe9d506d387d7d13d50842 [3512/4145] dt-bindings: Use hex unit address patterns
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611080203.OxBIUHI3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080203.OxBIUHI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080203.OxBIUHI3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: timer@4c00b000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: timer@4c00c000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb: timer@44006000 (st,stm32-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb: timer@44007000 (st,stm32-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb: timer@44008000 (st,stm32-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
