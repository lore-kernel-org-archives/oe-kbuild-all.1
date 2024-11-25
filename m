Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551CE1E480
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 23:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732576501; cv=none; b=KrCWvS1/JpGBw/R1LhcQo80ko0ipmNVuFO2TpfTGoo1tY2AQGhswf2AuuAG6PEZDl3FxImR8UpuUrnCjrKe+1aWSEEG5NMoCQipCWoYS4ftMslXlTSrh1L/z1nvueMQae2jbiKxsIMw8XJ1pXLEgG5+Q17L+lu1aEPDkfx7ISdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732576501; c=relaxed/simple;
	bh=1EeZw08KIj5nEuKJiZ5nz5/gGoq3oXUqAwsxz5h8fpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/HGoEp6PEWjRRPsAZTebKIb8h6ib067UTVFla9tYOaHnvgOi9E80Xv6HdzpyXazJ/ZeqcIlSb8CxsTX86+PmN9Bv3gji/WbH+soQggHL+e+CwdmcYvCECt+wW10hL4wnuPsCwsq12Nbbe6LlPYNhICnWZ0lmA+ByW/EieUjIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mfkon9rw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mfkon9rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732576499; x=1764112499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EeZw08KIj5nEuKJiZ5nz5/gGoq3oXUqAwsxz5h8fpM=;
  b=Mfkon9rwrZsza00sI+dDZCQnpdtybudBZFml1r8C9U0OWuIIFx50NQb9
   kpe2EUe1zHeuYnef7PKS9mXBkuZyDQ8WOVFnysxW4N9DLLu96SKACULUO
   l1/NIpJ2hiQr3G/CW5LMy/WQ6BShXYmKXTvsYbnukL61FgDByig7HcumD
   +RDfWOKk0iHlLC7ZQ5+1uftNBabARQtlF2Iku5kgXEfD3AWtsSJSsfFbl
   BcNVEnfimI5zy2mtcJrPLhlzBxbidgt0ToLoG2L1vNKXANj8UBXynW7U7
   Lk8FTK3zWHrF9NsbcqRqCUp8Gca2t5C9u7Meqh+SJZSTRxmMlDmTDfZ/2
   A==;
X-CSE-ConnectionGUID: BxOIcRChRFGywULLKBJ3wA==
X-CSE-MsgGUID: pzh4hvEETBGE0d+9KGUouQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32861575"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32861575"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 15:14:58 -0800
X-CSE-ConnectionGUID: wEfPDr32SqKU2jD9YyDdTA==
X-CSE-MsgGUID: NBJIl4e6QQ6wEulJCMMEVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91837227"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2024 15:14:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFiIB-0006t7-1A;
	Mon, 25 Nov 2024 23:14:55 +0000
Date: Tue, 26 Nov 2024 07:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 12502/12684]
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: power:
 'ranges' is a required property
Message-ID: <202411260720.VvPpR8yY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
commit: 3732ba90860059be49919a6f61775960a8834cb3 [12502/12684] arm64: dts: broadcom: Add DT for D-step version of BCM2712
config: arm64-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260720.VvPpR8yY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260720.VvPpR8yY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260720.VvPpR8yY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:414.11-434.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:355.24-382.5: Warning (simple_bus_reg): /soc@107c000000/hdmi@7ef00700: simple-bus unit address format error, expected "7c701400"
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:384.24-411.5: Warning (simple_bus_reg): /soc@107c000000/hdmi@7ef05700: simple-bus unit address format error, expected "7c706400"
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:431.12-433.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: interrupt-controller@7cd00000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: interrupt-controller@7cd00000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: gpio@7d517c00: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pixelvalve@7c410000: failed to match any schema with compatible: ['brcm,bcm2712-pixelvalve0']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pixelvalve@7c411000: failed to match any schema with compatible: ['brcm,bcm2712-pixelvalve1']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/mop@7c500000: failed to match any schema with compatible: ['brcm,bcm2712-mop']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/moplet@7c501000: failed to match any schema with compatible: ['brcm,bcm2712-moplet']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/hdmi@7ef00700: failed to match any schema with compatible: ['brcm,bcm2712-hdmi0']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/hdmi@7ef05700: failed to match any schema with compatible: ['brcm,bcm2712-hdmi1']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/gpu: failed to match any schema with compatible: ['brcm,bcm2712-vc6']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /hvs@107c580000: failed to match any schema with compatible: ['brcm,bcm2712-hvs']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
