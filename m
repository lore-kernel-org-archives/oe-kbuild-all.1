Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E5352003
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203740; cv=none; b=AurwEgZqAi1x6WDBpbIDMbkIz7X1jk5jFwnfMed44CnodpiVUSdvYkNj9Mw/ItPBL9xMekVAkyvNSAgIzCRQJdKw+Ug/9/TsSKDDhmGCLofRWwL2snKFtPiGjpAZw31reRUu4FZ4xDtp9LW84nxl7RDyKqJ2Zp0wJ83Xtuy0FC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203740; c=relaxed/simple;
	bh=plmYASEHbCazpx4zWvX+VhWGfSNnBBx7VAjdgCGaNQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YapLDwSm0zZC9LqLsuJ1wVOMW9m4aJKH1I60daEbHomeXgoaZ+zmNWOHi0B5hnDFNgFcpMJJFcs5BUK2gZ4mHg1RNESYDWySYscl+ZDeSugc+taH+tivY72mWmwVqOU7g+PJUWOJUaBbcVCB+3Q7mYZpUpx4svJNk8sHiGo4wTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBECGrbo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBECGrbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789203738; x=1820739738;
  h=date:from:to:cc:subject:message-id;
  bh=plmYASEHbCazpx4zWvX+VhWGfSNnBBx7VAjdgCGaNQA=;
  b=kBECGrbo8iMNuSfJLXsCe5ujhW7U/jt5EQ6BJZNP+0ZHDqxK+TLo5pJW
   KH4DC0g2BFRK6G+ovf58PSUVE+tQS4VeIfDA18eoAL5jwUpBs9gR0lW13
   MSrqaYBC8qmWmJHHq2JeyC7woN/YpzSREo+ZPz4qoshpUQ08N4JKBg0Ys
   8DO96AMkdbJHPPtR0norGj2LyqX3UBO+riH8dACxHr/JQHboWlbX0q4Wm
   f7q7QMA7nx931Z6vtWrIPiQ4cZ5RJSmmoADi9muKISCUHMXIw85BU0LnQ
   mVnKGO3qmMKnIO7c+RNgojkqVM88rG9GUXIsYWWrUT4FyBBpzpuDVFaly
   g==;
X-CSE-ConnectionGUID: B2510iXvSL6hQVqHfsYIeA==
X-CSE-MsgGUID: yw03Wgw5SwemVk6ujh4ElA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89527451"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89527451"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 02:02:18 -0700
X-CSE-ConnectionGUID: HJRHmrWdQ6uMYSVJ9JAeeA==
X-CSE-MsgGUID: y4NN8QwqT4a7tOhdvbip6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="270745542"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2026 02:02:16 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Jcj-0000000012N-1IyE;
	Sat, 12 Sep 2026 09:02:13 +0000
Date: Sat, 12 Sep 2026 11:01:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 32/32]
 arch/arm/boot/dts/ti/omap/am3517-evm.dtb: am35x_otg_hs@0 (ti,omap3-musb):
 $nodename:0: 'am35x_otg_hs@0' does not match '^usb(@.*)?'
Message-ID: <202609121030.ccd0ZWD1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   13e51269b6656768dc595ed6025e4974f2026543
commit: 0b5bde9e1c4df3bbf93a01a0e00c05085f3449fd [32/32] dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints
config: arm-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260912/202609121030.ccd0ZWD1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121030.ccd0ZWD1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b5bde9e1c4d ("dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121030.ccd0ZWD1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: target-module@480ab000 (ti,sysc-omap2): 'clocks' is a dependency of 'clock-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
>> arch/arm/boot/dts/ti/omap/am3517-evm.dtb: am35x_otg_hs@0 (ti,omap3-musb): $nodename:0: 'am35x_otg_hs@0' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/ti,omap4-musb.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/ethernet@5c000000: failed to match any schema with compatible: ['ti,am3517-emac']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-reg-offset: b'\x00\x01\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-ram-offset: b'\x00\x02\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: endpoint: ti,channels: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: am35x_otg_hs@0 (ti,omap3-musb): $nodename:0: 'am35x_otg_hs@0' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/ti,omap4-musb.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/ethernet@5c000000: failed to match any schema with compatible: ['ti,am3517-emac']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-reg-offset: b'\x00\x01\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-mod-reg-offset: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-ram-offset: b'\x00\x02\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: ethernet@5c000000 (ti,am3517-emac): ti,davinci-ctrl-ram-size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
