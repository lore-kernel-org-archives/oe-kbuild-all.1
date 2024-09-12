Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF903A8E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108055; cv=none; b=KEKoohcJ2mS964kN8BroUDUXaxx/WfYUj6o3yjTaZDfgkHEGJkCGNFwPOz9Mbu9xiKFkF3LFwQovQ/+Nwiy8DZHRzu4fnIVjpJnNT0889h2H2JQGNkIrfGpk7GLaEWgncTAMO9q9fOm7GsGp23CZgX38HlLap64MA/PPr4sBQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108055; c=relaxed/simple;
	bh=jF/l1S1Fhqv6f8rKxoKLrtMIXNlpa3wkz87uSKVOxzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NqSLO4SkcvtyWM4Li2nXpJAXTfkyjRmxSnn5MD26om4ohCHBch6TrIuVh2TU8jinzpekH9HMQpj4AcpLzXrgPCfPFKHDPmglo6L2mgwUi4SsagbnIlkSL18CdigFlBbtFV3LIvWEQHdGG/7PbLZAqpS/9bH/Ea/Kef//2RCrxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N69pZwy6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N69pZwy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726108052; x=1757644052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jF/l1S1Fhqv6f8rKxoKLrtMIXNlpa3wkz87uSKVOxzg=;
  b=N69pZwy6Bo1XeuVcbsb4/3sxJ8lgpv05mSLqE75zPEwEUxqfV3SWDXjC
   f8gzmREBaUj08x7Xjdway3GWJ8ALy/aVTHj9/uNgQX490vX4M5aAMlxjE
   x0veRaK64B76jil1ARpg5JpH8MRADd7O3QiBRaX6WAzrC1BgdN90JAEAi
   yCRRonON4hWeYSteZIR0d8QIgy1QjKoQqiYQxVl9zShtrWBFE/Ydd7e/V
   3xm2Rv2Y7qEgEUzXmWa1BpieleXeoEeVCm1XOPstPI3qgqvnUI1xPwHxe
   JXZkCZY6KyFMx1VefUxuJXk8GwxIJRU/2htwx/kCOe89YVTCdDioX5cR/
   A==;
X-CSE-ConnectionGUID: aNbDxR/CTt2+J8uSWQ8AYA==
X-CSE-MsgGUID: uYpV8fFPTFS4DKwlseEOQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812258"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="24812258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 19:27:31 -0700
X-CSE-ConnectionGUID: MP3pCy6MRGqOJvRbCKq3Bg==
X-CSE-MsgGUID: XeZf/5a4SdKlrb2FxPRMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="72544088"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 19:27:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soZYK-0004Ok-1O;
	Thu, 12 Sep 2024 02:27:24 +0000
Date: Thu, 12 Sep 2024 10:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8434/10296]
 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: sdio-host@80000000:
 $nodename:0: 'sdio-host@80000000' does not match '^mmc(@.*)?$'
Message-ID: <202409121005.2ZQv3b2P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 1c97ea115f89d096ec403f0827cc01671e3daba3 [8434/10296] dt-bindings: mmc: sdhci-atmel: Convert to json schema
config: arm-randconfig-052-20240904 (https://download.01.org/0day-ci/archive/20240912/202409121005.2ZQv3b2P-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121005.2ZQv3b2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121005.2ZQv3b2P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: ehci@700000: $nodename:0: 'ehci@700000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: ehci@700000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['microchip,sam9x60-ebi']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['microchip,sam9x60-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: sdio-host@80000000: $nodename:0: 'sdio-host@80000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: sdio-host@80000000: Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: sdio-host@90000000: $nodename:0: 'sdio-host@90000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: sdio-host@90000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: serial@200: atmel,use-dma-rx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: serial@200: atmel,use-dma-tx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: serial@200: atmel,fifo-size: False schema does not allow 16
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/dma-controller@f0008000: failed to match any schema with compatible: ['microchip,sam9x60-dma', 'atmel,sama5d4-dma']
--
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: ehci@700000: $nodename:0: 'ehci@700000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: ehci@700000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['microchip,sam9x60-ebi']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['microchip,sam9x60-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: sdio-host@80000000: $nodename:0: 'sdio-host@80000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: sdio-host@80000000: Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: sdio-host@90000000: $nodename:0: 'sdio-host@90000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-rx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-tx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,fifo-size: False schema does not allow 16
--
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: nand-controller: nand@3:partitions: Unevaluated properties are not allowed ('ubi@2A0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: nand@3: partitions: Unevaluated properties are not allowed ('ubi@2A0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
>> arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: pwm@f802c000: Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
--
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: flash@0: Unevaluated properties are not allowed ('spi-cs-setup-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
--
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names', 'phy_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', 'wifi@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: flash@0: Unevaluated properties are not allowed ('spi-cs-setup-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
--
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: pwm@f802c000: Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
--
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names', 'phy_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']
--
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']
--
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'mmc-ddr-3_3v', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width', 'vmmc-supply', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
