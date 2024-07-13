Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF11EB3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720847229; cv=none; b=XzoEH7Mz2voSf2ho3sW4M6YK8RlyCTC21RGzeklYz0hohpFdU8BQEaHn+sZwY7I8bs7rgv9TkMyB0Aav0VlaVIB7ehTNClk2xCBHz939Y2d1vpiiZpb5/+Z0LtppUD3MYXf2e4muWx/ohhpLun/HXV7K//syATtfEpEh3x3x2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720847229; c=relaxed/simple;
	bh=PM2y5DeeC9jedCFRGSQRUQvS/ImrQI2BscOIn0d34Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8lRbBrAEN2uvq7tE+w5NtuUJ3KXhNgeovWhXQpitSWuozfYqBEwtvisQZT6qMmQSW2zcAQmi6NdHrbtevo2Z69e2Z93IKGECnF8FQD2i92j6yM3hfHFFGglvVUnIN6u4IMP0H7aOM4/6EYLUMclwLw76tBs9pHc5mu/gQWdpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZA3JTMJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZA3JTMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720847227; x=1752383227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PM2y5DeeC9jedCFRGSQRUQvS/ImrQI2BscOIn0d34Bw=;
  b=QZA3JTMJHs3J56KnV93obSH1fxQLSjLVtTE8zPJ9L8IIm4AA3IvyzEZm
   Z6f6QveCwB2YXu0fXRiI5bsvcupA55m8IFcet7MjSCy+qRLrACsIN0Cop
   70vcVdsczhg6py1n/2uEhTFF0ZSgVoNNTSyseHI1StCjC9bjv3vrRVZr8
   a79ze2ZZ+859qOG0IX5+ISTSSYz091+VdClQr3aa68UDZSlJh5datKjrU
   baFJrBCbUSAG3PY5zWFMW+rr4FinB4o7pzjhu6RNve7JVwjxtqEsRvVCi
   jcAJjWwRWLuLKKt6S7dtbyWJOL2LMHa2tgIAyswJdzerQMbSmZOwhQKFO
   g==;
X-CSE-ConnectionGUID: nE/F2RQBQhGJIiOiB6nzBg==
X-CSE-MsgGUID: etScPSfiQfSJ8//bEkm/4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18414894"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18414894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 22:07:06 -0700
X-CSE-ConnectionGUID: 5vdZk9RxRmetCkQuKZctJw==
X-CSE-MsgGUID: vgVoP+//Q8GDrUBucCacAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="48994874"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jul 2024 22:07:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSUyL-000bic-2n;
	Sat, 13 Jul 2024 05:07:01 +0000
Date: Sat, 13 Jul 2024 13:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 11201/12880]
 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio@fffff400:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407131213.dNECvm67-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 337049890b8cbbb4fb527c58976ea19f4dc747a0 [11201/12880] dt-bindings: gpio: convert Atmel GPIO to json-schema
config: arm-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240713/202407131213.dNECvm67-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131213.dNECvm67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131213.dNECvm67-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: pinctrl@fffff400: usb1: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: pinctrl@fffff400: flexcom: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: pinctrl@fffff400: ebi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/pinctrl@fffff400: failed to match any schema with compatible: ['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/pinctrl@fffff400: failed to match any schema with compatible: ['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/pinctrl@fffff400: failed to match any schema with compatible: ['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio@fffff400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio@fffff600: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio@fffff800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio@fffffa00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio-keys: pinctrl-key-gpio: {'atmel,pins': [0, 29, 0, 0], 'phandle': 37} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/timer@fffffe40: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/syscon@fffffe60: failed to match any schema with compatible: ['microchip,sam9x60-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/syscon@fffffe60: failed to match any schema with compatible: ['microchip,sam9x60-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: pinctrl@fffff400: macb0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: pinctrl@fffff400: sdmmc0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: pinctrl@fffff400: adc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/pinctrl@fffff400: failed to match any schema with compatible: ['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/pinctrl@fffff400: failed to match any schema with compatible: ['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/pinctrl@fffff400: failed to match any schema with compatible: ['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: gpio@fffff400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: gpio@fffff600: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: gpio@fffff800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: gpio@fffffa00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'] is too long
   	'microchip,sam9x60-gpio' is not one of ['microchip,sam9x7-gpio']
   	'atmel,at91rm9200-gpio' was expected
   	'microchip,sam9x60-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/timer@fffffe40: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/syscon@fffffe60: failed to match any schema with compatible: ['microchip,sam9x60-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/syscon@fffffe60: failed to match any schema with compatible: ['microchip,sam9x60-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: rtc@fffffea8: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-rtc', 'atmel,at91sam9x5-rtc'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
