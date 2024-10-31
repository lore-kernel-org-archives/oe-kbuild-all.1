Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD26154426
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360884; cv=none; b=kG8wlJrWmkD/Bmn78iotOa2H7t8UpBuClNKnW0KbOBGloWw5vH7PXC9awCYJJpA3VviXNJFDASL39F2YGOqVXuAN3WVbUeRAVCRpgp4w1YenEGhQ46+n507X0Xk4bZf10XOkV38hm2nzh2ZYTfxZn5AW2J1lWLWPd0HB84fks9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360884; c=relaxed/simple;
	bh=tsPLyfkIJrnNfe1fQS3HoTZ2rDvtR9LtJb7QJOHNDYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeZMJasj0wbDFmFf7uGFp9m+JovrA/DpuQ+iDmiQqZQV4KOmqhRXSg8izmBHfIi2kPoXz/oQKNjZXLq6qWwDxXqXl+ab38P8DIVtdGg5Uy1ICzhz4kdx6dOQT/SXJhyECgTJAf6YYghA8Cn8K6+LfZs6/jNa+xwJDW5KW5PFZeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yy4tWt1a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yy4tWt1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730360882; x=1761896882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsPLyfkIJrnNfe1fQS3HoTZ2rDvtR9LtJb7QJOHNDYU=;
  b=Yy4tWt1aMKLKiJK2kgAMSqfGjL3RwTXiNIqiFxRx5GJxyEOoMRJtNqBb
   xEtDVcT10oWxRkFZf8d1IxS8JhVKSEd65rrOfXsZJ6Oc5uOtb/PkNPBn1
   jrI4gTUHuX+Ri5OMeI8C520Yrvf9n6y98RJwOpY5JUAYrwZfEIicKHcLD
   p5EI1QVPtZh7DrVcl0u8dHdw170hOrEv4bipwyWYCctpZNZtquyfA/3U3
   KCUnuG4BJ/2lDos1A+7dWXvGk7meEaAB4Sbhf+XA7P2zj6WIHy/g9ulMB
   akpaPfWaFA5IMThNxSG6pORZ8nJWYE1cIaT9WkQdGcllWDhkBIclB2YEj
   A==;
X-CSE-ConnectionGUID: Q/x+Pni6TQ+DdWVP71bcKg==
X-CSE-MsgGUID: snZ6tj4ER/yHbrvkSc3MxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17727506"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="17727506"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 00:48:02 -0700
X-CSE-ConnectionGUID: pRBBL+vBSSSMUJWWmSHEqA==
X-CSE-MsgGUID: AnOb2z0fQ8+WR3H5TDaUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82203476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2024 00:48:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6PuQ-000fp2-1i;
	Thu, 31 Oct 2024 07:47:58 +0000
Date: Thu, 31 Oct 2024 15:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 6768/8186]
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20: '#gpio-cells'
 is a required property
Message-ID: <202410311513.HEaRF2mz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
commit: 3ad8d3ec6d87b16cdd336aa065d8e150096a192b [6768/8186] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to yaml format
config: arm-randconfig-053-20241030 (https://download.01.org/0day-ci/archive/20241031/202410311513.HEaRF2mz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311513.HEaRF2mz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311513.HEaRF2mz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-rx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-tx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,fifo-size: False schema does not allow 16
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20: 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-rx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-tx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,fifo-size: False schema does not allow 16
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
--
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: serial@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
   	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
   	'ti,am654-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps@24: failed to match any schema with compatible: ['ti,tps65217']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
>> arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: mcp23017@20: 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: mcp23017@20: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: tsc: 'ti,wires' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: tsc: 'ti,x-plate-resistance' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: tsc: 'ti,coordinate-readouts' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: tsc: 'ti,wire-config' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: scm@0: $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
