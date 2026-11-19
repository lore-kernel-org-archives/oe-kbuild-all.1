Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079948;
	b=aPwUeV2JSn0OY1b2MwyfmZ5P85/xEe/VPXI1RQA5/Q6ALL8YE0amrePt2VEF4Dtzmo8v
	 yNCPRlrK4MOCxxyQlv/wJ/w3ZIypOEloyw4M0sRDLClim+0Y9yodoiTMTd1YMyiJjUnaE
	 1/fB5/1cyErxnvSesTmBsDZQnMWGLOxDH7oKi7/VRXtsb3672m08XE+xWE+nC35V9wgTN
	 I38kTgsuZ1HkpMOg+bdPQYlxaU/G9n+csZ4daKEhZv9XlHEQ9pfqe2J+zKDbURrKybRCI
	 QyAj28evcDAcyA3WWE6GabF3XFoAwJE3pC7qHWndwcwQl1Y49+IdvyANRU0a6MpIAoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079948;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PIoMEpJcWYEfMnEVnyyGOw/kTNJPTitRDL6l9kmuXpA=;
	b=ZdT4q94teh5SkLpVn0RJkDVrzIx5E2tp3ldctRHS/7I1nXa+NbEbwZ85mibp17eOncij
	 be5k9ONh2AszOfUmx0sf7cQe65wDgJJRgjQnb1CfaLyc2htaUn8LRQv9ltUN9kgHTEkGA
	 3mLT/IiHeSVvaPVWbhlf+Muc1kkIXysVA41onYDidwGAYLn1bCnCrNVy7Hybhxtm57JTF
	 rjBSjFMjFqpOEWlNYoIGTUQUvEZEYdkr9m2Cysy1iqr4aXa80Op6YwigcvnkOtB+LNh5l
	 ZL7FW5vpEcF4FCejvnN3NxSDcFJYe6yLQZbuAmm0y18o8OeqIq3uIbSSGl051nMziOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n0s+tUeR;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D1606A33F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 09:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8D1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n0s+tUeR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795079947; x=1826615947;
  h=date:from:to:cc:subject:message-id;
  bh=kUEDsz4r47scyEVXvU1hIL4tTgpjrXG/H3jQHMQ0Tw0=;
  b=n0s+tUeRDWlcqnaLRXEcdCaBSmjfH6F9dXdNZzhqiR/TJKT7DqASR/Lg
   0RC0YeMfy6SmrpnRWF5RQIRem+VrDKotxnC0uVB5Xuy2m6/8cZ0bXSekq
   JMEwkvrbpymJOvR/svBNe3RyJj/PxM+HYNdDixT+X8EPbU3JeDMcW+fkk
   2A7qS/fIY9uUH2bvqUG9Xj4GgJ/M051PTURMKd+BSyoYNb7A61Vjhf94y
   YcKKQLc4Ch9rjC1iqbDsgxNaCn43nwhVzNAMKXVPew94kYgxNS2M0pzbT
   aWhdmImXqtscSjfk01+9I/9ks6ABhj8c7x5OUIEP5fJsTcrlvGvHAz0QX
   g==;
X-CSE-ConnectionGUID: 9xmxyu+TThi0AdWVLWzHTQ==
X-CSE-MsgGUID: KTZ/mnIuRHKggPcLrPRlBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3948162"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3948162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:19:06 -0800
X-CSE-ConnectionGUID: ztdq3hLOQWyVmftrdqBjRA==
X-CSE-MsgGUID: oGCw/gMhS1O6WoTkysgiEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10455121"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 01:19:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTyIG-000000003k5-0wZG;
	Thu, 19 Nov 2026 09:19:00 +0000
Date: Thu, 19 Nov 2026 10:18:11 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [linux-next:master 8285/9180]
 arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: ov2659@30 (ovti,ov2659): clocks:
 [[51], [0]] is too long
Message-ID: <20261119101054.l74d6xE7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8017d29067fd1310a65c3494ce1a1b492adbac6
commit: 445278262c03ec6ee06b2e1ee4283a84ab83c3ed [8285/9180] media: dt-bindings: convert ovti,ov2659.txt to yaml format
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261119/20261119101054.l74d6xE7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119101054.l74d6xE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119101054.l74d6xE7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: serial@0 (ti,am4372-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps65218@24: failed to match any schema with compatible: ['ti,tps65218']
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: ov2659@30 (ovti,ov2659): clocks: [[51], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2659.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,wires' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,x-plate-resistance' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,coordinate-readouts' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc (ti,am3359-tsc): 'ti,wire-config' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: scm@0 (ti,am4-scm): clockdomains: 'ranges' is a required property
--
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: pixcir_ts@5c (pixcir,pixcir_tangoc): interrupts-extended: [[78, 22, 2], [79, 612]] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/pixcir,pixcir_ts.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: pixcir_ts@5c (pixcir,pixcir_tangoc): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/pixcir,pixcir_ts.yaml
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: ov2659@30 (ovti,ov2659): clocks: [[51], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2659.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
