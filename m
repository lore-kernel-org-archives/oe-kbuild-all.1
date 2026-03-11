Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930613B636E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246182; cv=none; b=lokvmfp+JtOmYayX1ww7vpeJDIU/DfIpb4JJNF5rr9S7RrVeWcgoMSReGzD6qIQ57eUp9mDUj9V2ftYXRqRw0qK557/mWNz3ETE2t73LexMcgBch89hW89HVHKbhA+9FsCNhGAclBQOXEt3CxnM1vqtz6kcKPcK3ofEhOonrRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246182; c=relaxed/simple;
	bh=Va9KWbAdw0RwSR9/tldkATLMhM9D6TeqnzlykEiuvY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnbeFx/DxFoAt1QY5S+mIpfeWftXkUCgcmNpj9BQljAS077xbTlhuj0Va1Zg1GdDPjIrzDT5M7Hdg8gGYmgGMAOLGmFTUnztwrmpiHMXT38Uru+/vohaaObyttcUFBlSbkqV29tYc/a2MvzW/C9MisM7b0WlGR7xCC3JnADN9Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbkE5MdT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbkE5MdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773246179; x=1804782179;
  h=date:from:to:cc:subject:message-id;
  bh=Va9KWbAdw0RwSR9/tldkATLMhM9D6TeqnzlykEiuvY0=;
  b=lbkE5MdTOv7AuwUXRHLXmSHNuY9BO7OLzZIgBAJZTIxJ9B1cEAOqAYlu
   XcK8GC6UnaQir4FPNT2xkp3CWtjjftgr4AGjfu5mBNM1azDEj7VjXKddX
   yscrQjUaYtBK5BCnHajJpjFvUvqjqn0NkuvvAEByDRDdE7gg4odRbRhYN
   xS3OcrcZj+snTEnZ3S4KSMP40Bh0/+yTvOVR7VyxFlhd8yI0MJRnABp6g
   +IOXOeOjHI3p4UD90KSQSb9qdPwaq0nyl3kCauVU/nDxYfIl6syqjtDEe
   oXFqsOJyil7+k8Nkjc/bRin5hjXmV98MZyPGHBxD2tuNVpvplKs3yKhr2
   g==;
X-CSE-ConnectionGUID: K75VUNtWSlmQuk5BtQ/L0Q==
X-CSE-MsgGUID: P9ni/EwJQ+OzaF6S+nrnig==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74198808"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74198808"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 09:22:58 -0700
X-CSE-ConnectionGUID: VHNuUCixTSKLoK2NXV/wmQ==
X-CSE-MsgGUID: MeeJbIXxTl+Cft5NP4zL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220470130"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2026 09:22:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0MKj-000000003M9-2abD;
	Wed, 11 Mar 2026 16:22:53 +0000
Date: Wed, 11 Mar 2026 17:22:02 +0100
From: kernel test robot <lkp@intel.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb:
 /soc/usb@200000: failed to match any schema with compatible:
 ['microchip,lan9662-udc', 'atmel,sama5d3-udc']
Message-ID: <202603111722.KN1alZ0Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4f0dd314b39ea154f62f3bd3115ed0470f9f71e
commit: a8e30c9d856ddebad75abaec55c019a7a85b16da ARM: dts: Add support for pcb8385
date:   9 weeks ago
config: arm-randconfig-2051-20260307 (https://download.01.org/0day-ci/archive/20260311/202603111722.KN1alZ0Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111722.KN1alZ0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111722.KN1alZ0Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: /soc/usb@200000: failed to match any schema with compatible: ['microchip,lan9662-udc', 'atmel,sama5d3-udc']
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: /soc/usb@200000: failed to match any schema with compatible: ['microchip,lan9662-udc', 'atmel,sama5d3-udc']
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: rng@e0048000 (atmel,at91sam9g45-trng): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/atmel,at91-trng.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): 'atmel,usart-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): $nodename:0: 'serial@200' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm/boot/dts/microchip/lan966x-pcb8385.dtb: serial@200 (atmel,at91sam9260-usart): False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
