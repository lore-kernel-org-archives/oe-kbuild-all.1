Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADD311940
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853984; cv=none; b=Ah0ZjBmfTfCdpxJD7bBn77Sp9zGnnLu9OO7Pi9Cgf8F2V0Ogr0bw0dIS+kc43WSnmFxt8Mk7Yp2g229egMYueYXihz3F7GcYfj5PZSBLUVdlnhkRS6/Kzess8nR+ydvDMn+JBwiHZBvxFj4SJjwR7FhI+vAo6vrSF2zr7EcILgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853984; c=relaxed/simple;
	bh=E4fbF7rWiubkughbmWI67Od/Aa7wvkSlqXu5jNqbybk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3k1VUy003byXWyWaYLjHcx5Jre91ZbUw8RU8ZrbublGUqO91VuIogND8+9ZDB9QIlJim/oc51it0tc8EIqAIX305GT8KZIt/qv6wDcqYRzkKmGGHu/Q6Q4n6KkRXOAuuPTJJprZwFQcQyC6oZJSXxupziOU5DVMEx+l6+d4VyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/75Ugrn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/75Ugrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782853982; x=1814389982;
  h=date:from:to:cc:subject:message-id;
  bh=E4fbF7rWiubkughbmWI67Od/Aa7wvkSlqXu5jNqbybk=;
  b=h/75Ugrn7ohBafEShuG2aNqljv0XgzaFbp3XxDynDKcl/tpZx56m4fea
   JtnKzStRjzl3UnArcTLWYciZ1YVA3PJD0e25X5oLxMr0ZTMInW6YrV3kD
   CiriiOyZXY6ROQFY+F1HDp1U8fwZwkwIKC2AAZbhM5cS8kSBz/CVaMIn1
   wRqKyIUGGAsRXcCyxo65BOHT/hv0Ikw+ldBCPs+NH9+b21PVBcoegwJpb
   d2mTGR0UqiWCHWssVxFwsVx7M7S5/drVTTwhtKAUkWwzALxIGvov9F84N
   gMj2G2ccWEKwITaNvo2HggiVnVT+sCQmWY+q3pNvze0QeLbLIexu+gR+D
   A==;
X-CSE-ConnectionGUID: yCDKiGMhRJyE+8iEMO3Ejg==
X-CSE-MsgGUID: ToQX+9efRjizpkVcEyYzsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="101005344"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="101005344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 14:13:01 -0700
X-CSE-ConnectionGUID: 2yPH4gzMS3K8PAULuGfBEA==
X-CSE-MsgGUID: wnZ2KwG/RVy4uo6rNJu5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="290493044"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Jun 2026 14:13:00 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weflJ-000000000Yx-4481;
	Tue, 30 Jun 2026 21:12:57 +0000
Date: Tue, 30 Jun 2026 23:12:27 +0200
From: kernel test robot <lkp@intel.com>
To: Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38
 (edt,edt-ft5306): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202606302325.xSdxaaQT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 731c634ea95ebf2eb0162174f14c6f341c44f71e dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3519
date:   3 months ago
config: arm-randconfig-2052-20260625 (https://download.01.org/0day-ci/archive/20260630/202606302325.xSdxaaQT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302325.xSdxaaQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 731c634ea95e ("dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3519")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302325.xSdxaaQT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: serial@0 (ti,am4372-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38 (edt,edt-ft5306): compatible: 'oneOf' conditional failed, one must be fixed:
   	['edt,edt-ft5306', 'edt,edt-ft5x06'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/edt-ft5306@38: failed to match any schema with compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/lis331dlh@18: failed to match any schema with compatible: ['st,lis331dlh']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,dra7-l4-per1', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): compatible: 'oneOf' conditional failed, one must be fixed:
   	['edt,edt-ft5506', 'edt,edt-ft5x06'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/edt-ft5506@38: failed to match any schema with compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58: failed to match any schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pmic: failed to match any schema with compatible: ['ti,tps659038-pmic']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pwr_button: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_usb: failed to match any schema with compatible: ['ti,palmas-usb-vid']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,dra7-l4-per1', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): compatible: 'oneOf' conditional failed, one must be fixed:
   	['edt,edt-ft5506', 'edt,edt-ft5x06'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/edt-ft5506@38: failed to match any schema with compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58: failed to match any schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pmic: failed to match any schema with compatible: ['ti,tps659038-pmic']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pwr_button: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_usb: failed to match any schema with compatible: ['ti,palmas-usb-vid']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
