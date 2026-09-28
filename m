Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB5F35675E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 04:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790568420; cv=none; b=BAltMMvtJmB8g/eU42VeEhhJVnin83a3FQBoS34L5tI2tYVZ526SbDxQBfhTxosItIpu7ofiMWnmuqqIHLfay0tn+RmVJ8j0Uc2cDDztBWAXrMeE7m2dA+tOdkcaIJbv6BdIErXPyQl/ieOxjgQvYZRTpAh/Lpvl1YYBJEKTRks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790568420; c=relaxed/simple;
	bh=B8VQbx0SkAgUVCGk45UbxzRFgUWFhVNfXBpwVreuYik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hpnmv0hvPNuPI2sWl0Mi8714D5kh3vt9UV+kVC20hDU1aumUsM/Y8ZAPGGUSIyRBL8kMUEK+kwTYtvKhKtqjnx5eNeOwRpT567nQSbwoZ9CsjIo+D/6cRLQjGZcp01SGehq08tM86rIF4j2356L9A9H9Bc5IyXmX+pbbUWUm3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npuDCdLf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npuDCdLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790568418; x=1822104418;
  h=date:from:to:cc:subject:message-id;
  bh=B8VQbx0SkAgUVCGk45UbxzRFgUWFhVNfXBpwVreuYik=;
  b=npuDCdLf+A21poAKPRsxj0T088llFvZIyxat0P+WDUBc56i5rVIMLqL+
   xOiRGNt13QE2aNmcwV9FGItoc7YNIXLXaNlHH+k70fhq07rGZ9OB9ufDe
   aMnvj+neW7ThCxt28+D5eYvxl5M54YJ7gC/l601jUFyF8j8z0XHU9pXdf
   ML3aZhVRE5g6HqK1hN/eWC65fZXG8sUXykmmDJXj/zwR+QtEb+ngn3IOx
   SrEqgAzpYGovZG5H/dBxgm2K4jEBONiCvxBlFnSuXL/FykOJH4M/Z24+a
   q/uN6f0vB2hu3CVC3bPLQCvfVc1ZRyBqv0mlmgEz1Rl16iPZMHW7RJejo
   A==;
X-CSE-ConnectionGUID: RoHYTINKQpe8yXMLzuuw3w==
X-CSE-MsgGUID: OMYVklJhQLq2+072gOghog==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="113043822"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="113043822"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 21:06:58 -0700
X-CSE-ConnectionGUID: 8nwpXVSvRJiT7VZrzoEIlQ==
X-CSE-MsgGUID: 4lw6r3E8QTSRKKu0moG2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="283009498"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2026 21:06:56 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB2dh-000000000rL-33VW;
	Mon, 28 Sep 2026 04:06:53 +0000
Date: Mon, 28 Sep 2026 06:06:52 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9518/10910]
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required
 property
Message-ID: <202609280606.83GFpQ11-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 43be6abd6775820fdac3729962f7e7b841104fda [9518/10910] mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
config: arm-randconfig-2401-20260925 (https://download.01.org/0day-ci/archive/20260928/202609280606.83GFpQ11-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280606.83GFpQ11-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280606.83GFpQ11-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg2: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg3: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/i2c@80004000/proximity@39: failed to match any schema with compatible: ['sharp,gp2a030s00f']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00h\x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: default_href520_cfg1: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: default_href520_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: spi@80111000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
