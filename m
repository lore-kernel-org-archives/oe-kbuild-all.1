Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7791DFDA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 00:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778343; cv=none; b=fWrPkw+BRV4fuXQ1dfzIbtHr8eZLg5b418AEYyeAaZ5eSnQJBw/5W/We4GuYY3ps8zO4Joam5BBE24vKWjGWwA2gxG4NXDlvymUrbqldcbUHU8yewfO2z7W4reYePrBm5qvWP94tjr3i/mj9pFhL9PBbWFSXim3oZ2aZqSHQf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778343; c=relaxed/simple;
	bh=JA5MjljmZM2mfhXfDiUnVaKgf9YMlXBohl3ujuJSZpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g09WNYlEzN76junquDO+ccWFlWqRQSx7QLHvIGRbpfE/RHIVgSXhuF6WmW2XQYR1nk+MaDaIrektM9zIaNFzHrXdrrI2Mc4NVkZmZj8n7ox3GzSFKkPoF0Ps+TC4Wx6lx2aCSzMa+zUvre9bn1GJGERAAujmZ/qmfvyHihhQ8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Af5BogBU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Af5BogBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789778340; x=1821314340;
  h=date:from:to:cc:subject:message-id;
  bh=JA5MjljmZM2mfhXfDiUnVaKgf9YMlXBohl3ujuJSZpM=;
  b=Af5BogBUQEvZ2uQ4C+0+GPrS4SJXaKt+mFqbw/AaZCH4/nRuUY72K6Rq
   5Du7sl6ISRdZ9YLHr1DfFoB8NR1T9cziofeq3ZM+7TX0Yhzt+2bFpbnFr
   THqxymsUn4CPZc+ylvXR0/HXy89IH9RFs/nC5KnUow/yBDonmrGwQiZ8U
   cxeHGsZ8ckQlD0BRecWeQYtP4Vjje7+SrTgkAR1dIuT8XcH3EnT3ba/RH
   l5rHP4UvmgrRQm4B49Jg4jwshJBb2DZgRpyel9pATrLRsBmOlRnjSgJPW
   BsiErMjWEisEhIWXpeBgm0rHkYUbfpBq7g1J5OrFS+pPw86Aa9wy3K9yI
   Q==;
X-CSE-ConnectionGUID: mC9oWu8tQSmJwAIsct2amA==
X-CSE-MsgGUID: JKEndfccRb+icNxluLuUUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90331991"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90331991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 17:38:59 -0700
X-CSE-ConnectionGUID: COh+YdbORFKqjQY7mfpFsA==
X-CSE-MsgGUID: YldJLqs2QxWSBDFn9Bg7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271979634"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2026 17:38:58 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7j6W-000000001Ge-0wV6;
	Sat, 19 Sep 2026 00:38:56 +0000
Date: Sat, 19 Sep 2026 02:38:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 32/32]
 arch/arm/boot/dts/ti/omap/am3517-evm.dtb: am35x_otg_hs@0 (ti,omap3-musb):
 $nodename:0: 'am35x_otg_hs@0' does not match '^usb(@.*)?'
Message-ID: <202609190235.TSalu1HE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   3b35f726c20d138fafa154182ee926a419306269
commit: 0b5bde9e1c4df3bbf93a01a0e00c05085f3449fd [32/32] dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints
config: arm-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260919/202609190235.TSalu1HE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190235.TSalu1HE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b5bde9e1c4d ("dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190235.TSalu1HE-lkp@intel.com/

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
