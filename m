Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24E5A4FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718315538; cv=none; b=KrBpInAs8QEh5oEGURAOElXvCeodJrNbGqtfr/1D2oyU+/m0xdTGgP/a62bZwocm4tcbRkYbkudLOT4WDeGOiP9rYQKwl24wp/JE+1ZRzCfYMUNnCwCQHxWca+GX+CM8U71Kutap7N324N5g7hApdwb1gwaT+08wcnLK5zdC28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718315538; c=relaxed/simple;
	bh=JLQy+iYE5/+hE1onqRxO8xS98OkfeLLZnCBKBalJel0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tr6/Q4fRscXlQvStdnbpwwwXvRJEDL7H431CY3UxXAohR1R3YE8ueFyxLj21jpFo5uzta60KQhw/0CDsEZW+4sEQNxk/QzUZLhZv9nZh5/j1JHcS7nV0LwrzO88ov3jy1Sc9u3cjGZgdq3JAIQUroAITwj1Cp81a4ZiDPnZYR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9VO+Cg0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9VO+Cg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718315536; x=1749851536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLQy+iYE5/+hE1onqRxO8xS98OkfeLLZnCBKBalJel0=;
  b=R9VO+Cg0xaKrr0U3Vu1UdVsW6J8Z3dk17eNtEqng95PFcQ6C2Ycr777k
   /fOJ+14R15UkhwRsXRMkl/+7lU/RSHSX+QUTqeXhoEeLiBoFR2MIY2xHx
   vlihKVfqL7euAubpXjA8ys00vhPJr0KDN3TBSEMVH6/uPOz3HwlzLWNgr
   4czmcz1e+p9vCVQiS6HBSYKS2UCYAJ7TA1X3s7zXdGJqiUJuRJToiZ6IP
   hhD7SmQMLmXn/mjWZYp5gADnP/NAyv3D8ZspZcFLK3Ca7bI2iUhe5Sm5D
   gpQN6+SGfNb/L1FwRFiO6i5rZKg98BVXYoohziH+j/JSzF2BtjtxbgKLe
   A==;
X-CSE-ConnectionGUID: 5W4pIU/xQi++tGwsYk9S4g==
X-CSE-MsgGUID: hGT+FtsBQSakr4vn2iMmKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37699366"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="37699366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 14:52:16 -0700
X-CSE-ConnectionGUID: TEJ1UwYAQtqXJFCn4Iqzcg==
X-CSE-MsgGUID: BWi95W8bT+yaVrUxvpkYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40216073"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2024 14:52:15 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHsMe-0000Qy-2M;
	Thu, 13 Jun 2024 21:52:12 +0000
Date: Fri, 14 Jun 2024 05:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 16/18]
 arch/mips/boot/dts/ingenic/cu1000-neo.dtb: mac-phy-ctrl@e8: compatible:
 ['syscon'] is too short
Message-ID: <202406140500.KIbBxWBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   035b86aab61498947d010dd7a1dd95f7343d5477
commit: d62bcc0529c132bdd0826953ebd81888d90c9d7f [16/18] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
config: mips-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406140500.KIbBxWBg-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140500.KIbBxWBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140500.KIbBxWBg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000: mac-phy-ctrl@e8: 'mode-reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000: mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000: 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^usb-phy@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: usb-phy@3c: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/ingenic,phy-usb.yaml#
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: mac-phy-ctrl@e8: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000: watchdog@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000: watchdog@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog'] is too long
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4740-watchdog', 'ingenic,jz4780-watchdog']
   	'ingenic,x1000-watchdog' is not one of ['ingenic,jz4770-watchdog', 'ingenic,jz4760b-watchdog', 'ingenic,jz4760-watchdog', 'ingenic,jz4725b-watchdog']
   	'ingenic,jz4740-watchdog' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: timer@10002000: pwm@40: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000: mac-phy-ctrl@e8: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000: mac-phy-ctrl@e8: 'mode-reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000: mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: usb-phy@3c: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/ingenic,phy-usb.yaml#
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mac-phy-ctrl@e8: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@12000000: failed to match any schema with compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd'] is too long
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'ingenic,jz4760b-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000: watchdog@0: Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
