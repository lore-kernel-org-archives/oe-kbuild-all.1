Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB7148850
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360284; cv=none; b=sqT5ErjvE0rCaBRnO6gOpDh6c8jABKUc3IiK9YYFKlCimKTiPgDCzjY+pAa/c9E2j7fTmFEHuCf44IiJ+eG9hyI47eetpbaq6IMkr9Wh7gngxcsl0u2Szirta+An3txEnSxD0+i8FiRTjfmguzxltG49HTYQJP75DaMZVVWXj+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360284; c=relaxed/simple;
	bh=gz3rdhenr2wohpvs4afQobTtBIBLDPvltWXrgKV3CXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOvWx8q8VhamGfOk+MUwBuZzEyE+l84E5yEUJuF+Niwfp9b6A3DQiJ0/jl48YP3ubzj4qYyX2P/Hasf9borrrbCDDC2XgGBF6WcT1dNz1/KAljD3nTLbzfG9EcV2oRYKJo7oQ/b9heQ6zSfdjKJhAQHHvZ/MBsWdQqgAyYwhjvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1gaNvfr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1gaNvfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730360282; x=1761896282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gz3rdhenr2wohpvs4afQobTtBIBLDPvltWXrgKV3CXg=;
  b=f1gaNvfrzSHN09OvykcHqDrwWyQP/Nx4uhlPTq27W81p3Svb7iKW9ZSS
   KkbH7PXl+tIyerDH77YxdwcY8p4W2tvqW2OeZi2SLtodCnpwX7gdFGj5V
   fjNTmzX5Qf562XcrEXIH1fVof22OG22w4F1MKI/JdeRKT5LlfjfEYmprW
   kg8PBKsR7iwl9gbY0NvuSUnq4I4P+y4Et7q9qi7m/Datm2XefJudIbTbv
   SET8EcKmUYKlI7rHHZBsRjXnE0RGd8Lh4ZTuA94stoyOD77FrntV17YFt
   D/Pqfoqml+JumkLByim6doMONy+QCd34cQylXdz8T9xPt026oZLibxUhQ
   Q==;
X-CSE-ConnectionGUID: 11BcmDvMTqGoIYDLe4beDQ==
X-CSE-MsgGUID: MoZw06UsTXegnwEAq0bQ3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30299514"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30299514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 00:38:02 -0700
X-CSE-ConnectionGUID: J5PH97HSSmW3JysUne6hAA==
X-CSE-MsgGUID: NpK+yPLNQoSM1U4/2UCp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82709976"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Oct 2024 00:38:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Pkk-000foS-0u;
	Thu, 31 Oct 2024 07:37:58 +0000
Date: Thu, 31 Oct 2024 15:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 6768/8186]
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20:
 'gpio-controller' is a required property
Message-ID: <202410311546.6Jor3ucy-lkp@intel.com>
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
config: arm-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241031/202410311546.6Jor3ucy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311546.6Jor3ucy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311546.6Jor3ucy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/timer@f800c000: failed to match any schema with compatible: ['microchip,sam9x60-tcb', 'atmel,at91sam9x5-tcb', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-rx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-tx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,fifo-size: False schema does not allow 16
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20: 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-rx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,use-dma-tx: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: serial@200: atmel,fifo-size: False schema does not allow 16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
