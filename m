Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0E8154445
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731173097; cv=none; b=HawEUfQSnRekUIjBO+8kasNVRMWSiL/znQnGeteWNR7q0doocmbZhFl+jbBhOBvbZEfGuY5ctW1cCKwz1wJ5M/UqRKnjYSi0VHcP5A+4Q1nsWcRDsILhph93x01l8iETh5hVQbsAVtMxa2kBuJO4LA96cp6wckVSUZYX/iQtIGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731173097; c=relaxed/simple;
	bh=FuPzF680pXcb9JXRDnYnBBaDPbsBoM71l/Bucksmlx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVGcUnrzaJqXo/RIM889GSKM7XFjzB3hnQKZYrRAr1M4LUqe1VilfyqiTkwK8yXXPmh63GovD7lMNGwmAKNjRVLoEu1gqH8Vv/7XzQG5l8wvn5+k+BR37eC09Ao8y/SW4l6p4qmTZMuAGYSsR80vbGnOib50/ptVF32X5a+qRp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOKXZT8H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOKXZT8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731173096; x=1762709096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FuPzF680pXcb9JXRDnYnBBaDPbsBoM71l/Bucksmlx4=;
  b=aOKXZT8H+rm3Y6C025kquMWr5UEVlDxg6H0k/IvCfBJys2aXg809iTvZ
   TQF0Uemx8LG++PMmnqMEQ1MCn4KlxTEE1Z23qGXuXZ8xq/utISWzvLcwU
   z283ZCisI1EUV/n76jRAIBjN65rFrHocdHxEtieMq9op6GDvO9RaGjQiY
   hG52CSGznX8EgU6sbtlsVjb1SR+j/Juw4UurD5S2wJK4ALtuWpQsK+RwB
   po5Ro/64wHseVgPPwiffu0yOAQkD3PeFPYeiKlCHnNMDGrKyZnNZIe3Uj
   in3iTctKGOHykE1dtWF791CxnYreWFNQx1pVrp8qCnXwe1JgyZ9ryo0XQ
   w==;
X-CSE-ConnectionGUID: /Qwe2A1ZSqCW8p0pQAOdeg==
X-CSE-MsgGUID: ekB2nV1dQXyWqp2u0IzX5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="48553732"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="48553732"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 09:24:55 -0800
X-CSE-ConnectionGUID: Pu75f4KnTxGa5FPD24QNKQ==
X-CSE-MsgGUID: ewabRAlhRESXq6noFThINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86422889"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2024 09:24:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9pCc-000sVO-1Q;
	Sat, 09 Nov 2024 17:24:50 +0000
Date: Sun, 10 Nov 2024 01:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 9453/10190]
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000: big-endian:
 False schema does not allow True
Message-ID: <202411100149.TEmF3HPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   74741a050b79d31d8d2eeee12c77736596d0a6b2
commit: abf4497f50fb533ec53e07ed3e2e0a4bb027502c [9453/10190] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property
config: arm-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241110/202411100149.TEmF3HPY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100149.TEmF3HPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100149.TEmF3HPY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: adc@35: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1238.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000: big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: display-timings: 'mode0' does not match any of the regexes: '^timing', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/spi@1550000/flash@0: failed to match any schema with compatible: ['spansion,s25fl064l', 'spansion,s25fl164k']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: watchdog@2ad0000: big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1118'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/spi@2100000/at45db021d@0: failed to match any schema with compatible: ['atmel,at45db021d', 'atmel,at45', 'atmel,dataflash']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/spi@2100000/at45db021d@0: failed to match any schema with compatible: ['atmel,at45db021d', 'atmel,at45', 'atmel,dataflash']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/spi@2100000/at45db021d@0: failed to match any schema with compatible: ['atmel,at45db021d', 'atmel,at45', 'atmel,dataflash']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000: big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000: big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet-switch@1: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000: big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000: big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
