Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF75C42DFEC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 23:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675880; cv=none; b=NgX6WtsQW2evk0JcGT+ZZw95tT+kChXma6CEGDAZxSUSqRKB2CWUjgaCs53jgjQkp0hx3Zn+uguYO66BmoQ5LD9fgS02B3QUYYxGkwiYdP+jQJ1y9wHvjUE/6AeAepCoK0pyrEF9TCFgAgd+Zugcj/kiYEb+MWlAqA6NElVV4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675880; c=relaxed/simple;
	bh=mp/7t/oiRfwFxqtM2E5+MKy0Irdb/F/uXylE+b5Nmdc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GvTB/8euw89KdcPJL926rDbKXFLoaJ/PQXMDLIG2AZoYAZZBnF0hZiBZ8OL91rkCgLqostl7Pf80gM4eY+uz7Pt3XLqVMcnLl6X46ovEKqhC9YuFcNoDAJs+lIQuSzv6z+SZthUQI0lp2fHL0RmG9oLpSr2aBFprEMzEbuisaMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceHFjznm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceHFjznm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784675878; x=1816211878;
  h=date:from:to:cc:subject:message-id;
  bh=mp/7t/oiRfwFxqtM2E5+MKy0Irdb/F/uXylE+b5Nmdc=;
  b=ceHFjznmC0miZZu3kRhMwCkVFrcyz/6JlCR4+602Wuadxkda6LZUgVCT
   /m4/xjJ9NqSjNQ2Qe13JQ6OUs+imnBVY4AHB7ixljWWiTlFwu5fbKGnv4
   TjyejLMK3UX3K1GoSs9lPbHGfANtsjPpz/J5QCJaSvsoE54md+yF8kzEv
   6tZniMpB1ewfq2z+8zJ5a1bsn4JZ3XGbCTQan3cGV2s8oQvgURGUMHWsU
   P941xT7gpeJVYbXTLArBQ0fPyXAEU+rt4sQqzbz1e0w3Le5VKEYAQK5bY
   qH4emKB7Mtf2flkdEr4rWDfkp6LtDy+nUMYmDB2F/JtWVUL+wZiII53SJ
   w==;
X-CSE-ConnectionGUID: hq8OoUvCQJCyh0DetuETWg==
X-CSE-MsgGUID: IhXHxc5tQX2aVO5tzyteOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96810199"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="96810199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 16:17:58 -0700
X-CSE-ConnectionGUID: CBeNZP9KQwCttBd1sXy7Lw==
X-CSE-MsgGUID: pjy9S3QxRDK/ZRCoZQQLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="253998790"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 16:17:55 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmJij-0000000009E-0FYs;
	Tue, 21 Jul 2026 23:17:53 +0000
Date: Wed, 22 Jul 2026 01:17:25 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/mips/boot/dts/ingenic/qi_lb60.dtb:
 pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0:
 'pin-controller@10010000' does not match
 '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
Message-ID: <202607220112.KtMzmbKu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: 9e5e1de61db29277d107bd6985c57629df449610 dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
date:   3 months ago
config: mips-randconfig-2051-20260721 (https://download.01.org/0day-ci/archive/20260722/202607220112.KtMzmbKu-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220112.KtMzmbKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e5e1de61db2 ("dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220112.KtMzmbKu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: nand-controller@1 (ingenic,jz4740-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: /ecc-controller@13010100: failed to match any schema with compatible: ['ingenic,jz4740-ecc']
--
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-ost'] is too short
   	'ingenic,jz4770-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
   	'ingenic,jz4760-ost' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-tcu', 'simple-mfd'] is too short
   	'ingenic,jz4770-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: pin-controller@10010000 (ingenic,jz4770-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10030000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10031000 (ingenic,jz4770-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
--
   	['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'simple-mfd'] is too long
   	'ingenic,jz4780-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'simple-mfd' was expected
   	'ingenic,jz4760-tcu' was expected
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: rtc@10003000 (ingenic,jz4780-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-rtc'] is too short
   	'ingenic,jz4780-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: pin-controller@10010000 (ingenic,jz4780-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000 (ingenic,jz4780-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000 (ingenic,jz4780-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: serial@10032000 (ingenic,jz4780-uart): 'dmas' is a required property
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /timer@10002000/watchdog@0: failed to match any schema with compatible: ['ingenic,x1000-watchdog', 'ingenic,jz4780-watchdog']
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: rtc@10003000 (ingenic,x1000-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1000-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1000-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc']
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: pin-controller@10010000 (ingenic,x1000-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000 (ingenic,x1000-uart): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: spi@10043000 (ingenic,x1000-spi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0 (nxp,sc16is752): Unevaluated properties are not allowed ('sc16is752' was unexpected)
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@10002000/pwm@40: failed to match any schema with compatible: ['ingenic,x1830-pwm', 'ingenic,jz4740-pwm']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: rtc@10003000 (ingenic,x1830-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-rtc', 'ingenic,jz4780-rtc'] is too long
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4740-rtc', 'ingenic,jz4760-rtc']
   	'ingenic,jz4725b-rtc' was expected
   	'ingenic,x1830-rtc' is not one of ['ingenic,jz4770-rtc', 'ingenic,jz4780-rtc']
   	'ingenic,jz4740-rtc' was expected
   	'ingenic,jz4760-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1830-rtc', 'ingenic,jz4780-rtc']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: pin-controller@10010000 (ingenic,x1830-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: serial@10030000 (ingenic,x1830-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-uart', 'ingenic,x1000-uart'] is too long
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,x1830-uart' is not one of ['ingenic,jz4770-uart', 'ingenic,jz4775-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	'ingenic,jz4760-uart' was expected
   	'ingenic,jz4740-uart' was expected
   	'ingenic,jz4750-uart' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
