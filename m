Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66F1C1ADE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700217; cv=none; b=NuXjknXb2aJSN2uurTcqgVpmUqVP1HJgzIkJCLLNBDItgJWbpUItLL4hsc5zQKSgno+z3/6NwdM5KGwVT1078gPvjfss/hAsH9vFIoeXkv8wzvPnpje25vN6pTDAtGF1HINFqJ5T0ViXFhGLT5kK1ORt9GqKXzL+8tDU8Afths8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700217; c=relaxed/simple;
	bh=/GI6eRKq8KXtkaAdRIE9o6M1Nk+pORb3EFoXj/cEcxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=az8nv7Ra3B6oFA2l30J4th4zmFrzvamluiywm56E0U0gfAjiZv0WmM/Lq8uw/NYEXn2ZRUfVGbl9XZcqbUWelMF3vLK0nOaLOwTOL20aZT7X3GOM9QZpdBRNM5uicm6LfdP85Af3mEtzXZby2Iv7ceH8wtKs3uGTergjkGRLphI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqtET1jT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqtET1jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729700209; x=1761236209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/GI6eRKq8KXtkaAdRIE9o6M1Nk+pORb3EFoXj/cEcxA=;
  b=FqtET1jTOrpKGrqCz0bVcasxBUggi3czk86i1X78Z+4/m1I9+dikxiFv
   JjAXey9HhkATRXmtdky5jp9q47gpd00si7dg7UBmDDBn+9f6pQdkJnc/3
   PFh6mBvW1f+TP5ZV+9FDyFH6jLofTMpIAOGlHUU3yjweUOZlxHJot5ojK
   PiQ4O/6x+eaPXIVwFdJqzLfDJp48150n9OTwv8vx1uKcXSPc5UDn9fnJH
   blHu8vtRLZ8ylZ9ldNhYXkSYRlYsDuomC75HfXhrqfxFLgsW/Gkc8GE04
   Ix3j3d90ZK1EKXLMrNiu3/ysWbSfqlF6HC9NVDrfebI4/J8ksZuJCHYv0
   g==;
X-CSE-ConnectionGUID: Vj5ck+euQOSeXvQa9MfSDg==
X-CSE-MsgGUID: Nzlhct+ZQh2J6ZqwzdPCNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29459904"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29459904"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:16:48 -0700
X-CSE-ConnectionGUID: zsnQ9ysPSNCCn5WPG3QTGw==
X-CSE-MsgGUID: bFTBcL6zRMW8Qhr4Jt5NTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80201739"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 09:16:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3e2O-000V8V-0x;
	Wed, 23 Oct 2024 16:16:44 +0000
Date: Thu, 24 Oct 2024 00:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4278/4954]
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48:
 Unevaluated properties are not allowed ('audio', 'bci', 'clock-names',
 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were
 unexpected)
Message-ID: <202410240002.XRKdeTAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: 8a2ef90ff7924250db535454ef92ba2961b80fba [4278/4954] dt-bindings: mfd: twl: Add charger node also for TWL603x
config: arm-randconfig-054-20241016 (https://download.01.org/0day-ci/archive/20241024/202410240002.XRKdeTAI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240002.XRKdeTAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240002.XRKdeTAI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: tsc2004@48: $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: tsc2004@48: $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
--
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
--
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: ads7846@0: ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
   	1 is not of type 'boolean'
   	True was expected
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: ads7846@0: ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
   	1 is not of type 'boolean'
   	True was expected
--
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: en_on_board_gpio_61: $nodename:0: 'en_on_board_gpio_61' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle']
--
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: en_on_board_gpio_61: $nodename:0: 'en_on_board_gpio_61' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48072000/itg3200@68: failed to match any schema with compatible: ['invensense,itg3200']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: tca6507@45: led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48072000/itg3200@68: failed to match any schema with compatible: ['invensense,itg3200']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: tca6507@45: led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: tca6507@45: led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: tca6507@45: led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48060000/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48060000/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-pre-es3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48060000/gpio@20: failed to match any schema with compatible: ['microchip,mcp23017']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-n900', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-n900', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/led-controller@30: failed to match any schema with compatible: ['adi,adp1653']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: lis33de@1d: compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-reset']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: lcd@1: Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'clock-names', 'clocks', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-reset']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: lcd@1: Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
--
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
--
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'power', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/i2c@48060000/lp8720@7d: failed to match any schema with compatible: ['ti,lp8720']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48: Unevaluated properties are not allowed ('audio', 'bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/interrupt-controller@48200000: failed to match any schema with compatible: ['ti,omap3-intc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
