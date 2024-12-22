Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9C2913
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 01:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734832453; cv=none; b=I+LYE6wkAEZM38ZJduiuQxlUViqhN7xSVwnbjlK8l74PEy5jxMefHbE9Sw2kWFNVfb0du1zVrD7OKbbIZyt/oA357AjMrR6okLppJ3R/nh5O7qSH5Wgz7IgYnDYcIwH1YY1D1PNyGzhhq9bHH1lcV56nZGtsI2gYR3j2BVUoDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734832453; c=relaxed/simple;
	bh=s0C8DVcSmTErNWyrGjfAYdbqCBapOomPZzORzMimaJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5ktEOx54gnZGHeqgrdgSeWVBGOn5TXclNpIj4yDXarMw/ilgYyvVPCE50tVz0b38jaXKkOnIkRdoAVET39xYXZPnVnXZV2BtirW1pi/ZA+HFWcYwKxCZfBY9veh48QfXWeICUhCKdzACxYvDQMm6QACxAAoxy/B8nv3y3wXyt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fw2Wifsq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fw2Wifsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734832451; x=1766368451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s0C8DVcSmTErNWyrGjfAYdbqCBapOomPZzORzMimaJ8=;
  b=fw2WifsqFX0YNH5ny170HJScmLtqytkhNC3TqdRGzpZk+E5OuJ8sk/dU
   s1iTNQsyGOJ0pWV3eHoPFQYtROeKhcJuwtVQ+CyqnnNK52KROdE7fQDJ+
   z9VzGDFnAkK5wDTf/6eUqGo9VhnTZpfLbSy4LCfulWVTv/8V80ApA/jzX
   StSspH+aREHWMKRq6FiF5YWNzdL553/93a3n4Z6BegQPZvmsbcixwhgRo
   IU3/dqv21XlCJjxLuF0ZZI7BbMjuWyh8aeqG+loRo8jF8JZ9ovBlvN10X
   t5f+07lxlaJoGTvRS7aAtJbrkqPXJVIUrDc0L4+0QiyUzTYMrZNgINcGQ
   w==;
X-CSE-ConnectionGUID: ZNRiWocZQQytQmFJCvkl/w==
X-CSE-MsgGUID: g94jyPCYRrihMs+sQZPD9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45943758"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="45943758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 17:54:10 -0800
X-CSE-ConnectionGUID: 8TbdwdiWS8CN2wDXOzSHUQ==
X-CSE-MsgGUID: 1GGEqHudSXS8QwP75ZjGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98680750"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2024 17:54:09 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPBAV-0002ex-0n;
	Sun, 22 Dec 2024 01:54:07 +0000
Date: Sun, 22 Dec 2024 09:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Birsan <cristian.birsan@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 4774/5236]
 arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000:
 Unevaluated properties are not allowed ('bus-width', 'disable-wp',
 'no-1-8-v' were unexpected)
Message-ID: <202412220933.KGVuxFTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 29e0bd689ae907f3a78d3671d03364c99915b5f8 [4774/5236] ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
config: arm-randconfig-053-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220933.KGVuxFTJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220933.KGVuxFTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220933.KGVuxFTJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
