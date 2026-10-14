Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BAD4EC649
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982388; cv=none; b=oIVAqKb9NT2m4ogdUJ9dcJknirSL5wUmeA6Lnof12ACsfJ4rHgBjTUfQvdb+tC+2PIXPNJ3f1WQM63ykqjngOVoIQUbKRsZf8zesDoZYBPGpMvcbUXeT0WjSXG1nqENnx82e3wNj+wqy2chyhpPL46fcLkqPeh4+NaYKRGzfUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982388; c=relaxed/simple;
	bh=LMjk0oXAt0rKU3llAiPtiretmvq8VLql5tdSn0sZiTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fNaqEN2NMOmOHyAU9Yblu6GlMHxPKtoOlKOVBnd+83E+2vSQwQLqpnhwmL+wOxZqn2NCnWGHAs9A9FCMOm5/WSgCMXZXaef/z6i4yAPMeYmhKT6WghngI6c1t+JKLtqmanBIEt21B9x0R6+j7nz9LNbNPekMIXsGyxGm58vxZ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2jVbgFR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2jVbgFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791982227; x=1823518227;
  h=date:from:to:cc:subject:message-id;
  bh=LMjk0oXAt0rKU3llAiPtiretmvq8VLql5tdSn0sZiTQ=;
  b=b2jVbgFR/H0Q+Vam5hRGOUdUYtUJRJSfGwhF2URQFN8Lx8++eOu8Spok
   fpay9kH/x2M7QuDhrus4H/JKKHapH34XzKefrtLPI+/FNnhP6Hd+n3bIY
   9+L2qQ4pWrhdoO8L11deLAaVsaDWitIe3IKgUw65PEq5nFc2sz9qteaJl
   VD32FLwJ8FJpdGOURtzytb41xBLVC7Ek72RZbTLGkMDFvD6rIHELHMExM
   M8OBTh02JRcnjHSvwvZpQsVA2VKgasOvtamzHb4YFnTQhQiAN5joAeJTb
   hoF6DZ9hfC1SN5jO3VriORHbWo9otn1U8q4VuIypIFJXXGb73cbhEAkdt
   Q==;
X-CSE-ConnectionGUID: +8SOh4t5RA+BYeROBL96Dw==
X-CSE-MsgGUID: MiTLbUE2T96lbgdNSd2A/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="625372"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="625372"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 05:50:26 -0700
X-CSE-ConnectionGUID: KIXz/RFlQYKuJS0nKApH1A==
X-CSE-MsgGUID: ECABmF7oSk25w8w9W3UF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1440376"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 05:50:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGyR3-00000000B43-2itm;
	Wed, 14 Oct 2026 12:50:21 +0000
Date: Wed, 14 Oct 2026 14:49:43 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@nabladev.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 10997/16498]
 arch/arm/boot/dts/st/stm32f746-disco.dtb: syscon@40013800 (st,stm32-syscfg):
 False schema does not allow [[1, 0, 174]]
Message-ID: <202610141435.Tun39EHI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
commit: 3cead63752de9036025d00ab910540d1104f9317 [10997/16498] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
config: arm-randconfig-2404-20261001 (https://download.01.org/0day-ci/archive/20261014/202610141435.Tun39EHI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141435.Tun39EHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141435.Tun39EHI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
>> arch/arm/boot/dts/st/stm32f746-disco.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
--
   arch/arm/boot/dts/st/stm32429i-eval.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
   arch/arm/boot/dts/st/stm32429i-eval.dtb: /soc/i2c@40005400/camera@30: failed to match any schema with compatible: ['ovti,ov2640']
   arch/arm/boot/dts/st/stm32429i-eval.dtb: stmpe1600@42 (st,stmpe1600): 'stmpe_gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/st/stm32429i-eval.dtb: stmpe_gpio (st,stmpe-gpio): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/st/stm32429i-eval.dtb: stmpe_gpio (st,stmpe-gpio): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
>> arch/arm/boot/dts/st/stm32429i-eval.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
   arch/arm/boot/dts/st/stm32429i-eval.dtb: /soc/crc@40023000: failed to match any schema with compatible: ['st,stm32f4-crc']
   arch/arm/boot/dts/st/stm32429i-eval.dtb: ethernet@40028000 (st,stm32-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/stm32-dwmac.yaml
--
   arch/arm/boot/dts/st/stm32f469-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
>> arch/arm/boot/dts/st/stm32f469-disco.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
   arch/arm/boot/dts/st/stm32f469-disco.dtb: /soc/crc@40023000: failed to match any schema with compatible: ['st,stm32f4-crc']
--
   arch/arm/boot/dts/st/stm32f769-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
>> arch/arm/boot/dts/st/stm32f769-disco.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
--
   arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
>> arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
--
   arch/arm/boot/dts/st/stm32746g-eval.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
   arch/arm/boot/dts/st/stm32746g-eval.dtb: stmfx@42 (st,stmfx-0300): pinctrl: 'joystick' does not match any of the regexes: '^[a-zA-Z]*-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmfx.yaml
>> arch/arm/boot/dts/st/stm32746g-eval.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
--
   arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
   arch/arm/boot/dts/st/stm32f429-disco.dtb: stmpe811@41 (st,stmpe811): 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
>> arch/arm/boot/dts/st/stm32f429-disco.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
   	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
   arch/arm/boot/dts/st/stm32f429-disco.dtb: l3gd20@0 (st,l3gd20-gyro): 'spi-max-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/st/stm32f429-disco.dtb: /soc/crc@40023000: failed to match any schema with compatible: ['st,stm32f4-crc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
