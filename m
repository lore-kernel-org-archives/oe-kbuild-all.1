Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624346AA9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757081; cv=none; b=TeG9W7n0zQBwfn58WbSjWNUQnga7sg6mtJh9dAH9c6qpkpzone4jJg/lB9Fp4eSXmiTfnEw74R8toYUhX0Y/GD5ZgK7JnTFDsyeSh+I0iRMpyqksCBef0mwr4l+zU3Rf68qCy8zE4/t3CwDZeX0ZV7wLnZbKvnbemeJqbMytimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757081; c=relaxed/simple;
	bh=JW0kvZlwd5qlLyxEhF4znvggNue0DmQhFv7M80zzays=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kCd6ocSPAeHf0ZbFOIsQbNgwP7pGaDc7RC06Nct+rpASGw9OcegpoFc7KnowEPWFSfTex2aN9qp4PoQxmlrpFiBBzLoYFeCTVPJ4jLEriqu9GecBPlIQzourYUhIEg9Sp2p791Jfuom+Pi9eX+moKNWQpU4uMigsu4SUUPGAjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeCDV44d; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeCDV44d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790757076; x=1822293076;
  h=date:from:to:cc:subject:message-id;
  bh=JW0kvZlwd5qlLyxEhF4znvggNue0DmQhFv7M80zzays=;
  b=QeCDV44dT9IJH3kAwKh7982mcTC97iofJ4ZMZrMzaXrmtOqJCSLxhUKJ
   vnl6c1L8Zv4/9hi5csjRb2PCb686Tu9Ra1u5uWcA/MlrPnzqGk+4R+vg1
   2THfbe3ZWfmCdTnVb4xFqLUuoY+GvDYbX/edbSCL7cSeBhRqzCW0mV0aB
   8YUO0BTtM5LeEedaS194hLbZk/bkQ84UXyW9buw2arwn3T0HNPNGVvwJS
   ywswAYMZaOYb3nD1UzgHgH5fSEslLd5Wn2t9/CWqLMQl7jmQCQdoP2mnP
   W5GeqBCbeSbATyGX80Z6weVe4wTbJrd/mrqDZx0/yDwowLI9dwKBQuTCa
   Q==;
X-CSE-ConnectionGUID: vpVfv/5LRI2nxQWvU2Llxw==
X-CSE-MsgGUID: ODYqAHP8SMqRe2JrpnPGQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93976237"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93976237"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:31:12 -0700
X-CSE-ConnectionGUID: DB4OqQwWSKOFZCQQr7qpNQ==
X-CSE-MsgGUID: fCpu8cqbTXmoVESDd+ZXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="301880272"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2026 01:31:10 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBpiV-000000001nb-3sCd;
	Wed, 30 Sep 2026 08:31:07 +0000
Date: Wed, 30 Sep 2026 10:31:04 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 8900/11456]
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required
 property
Message-ID: <202609301056.m1VNxu3Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: 43be6abd6775820fdac3729962f7e7b841104fda [8900/11456] mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
config: arm-randconfig-2402-20260925 (https://download.01.org/0day-ci/archive/20260930/202609301056.m1VNxu3Z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301056.m1VNxu3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301056.m1VNxu3Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x00B' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: default_hrefv60_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: default_hrefv60_cfg3: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: ab8505 (stericsson,ab8505): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: ab8505 (stericsson,ab8505): gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-close-hysteresis: [0, 0, 0, 15] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-close-hysteresis: size is 32, expected 8
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-far-hysteresis: [0, 0, 0, 64] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-far-hysteresis: size is 32, expected 8
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio-line-names', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio-line-names', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: codina_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: codina_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: codina_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: default_cfg1: ste,config: b"\x00\x00\x00'" is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: codina_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: codina_cfg3: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: codina_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: default_cfg1: ste,config: b"\x00\x00\x00'" is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: ab8505 (stericsson,ab8505): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: ab8505 (stericsson,ab8505): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: ab8505 (stericsson,ab8505): gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: proximity@44 (sharp,gp2ap002s00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: accel@18 (bosch,bma254): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/bosch,bma255.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x00C' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: default_hrefv60_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: default_hrefv60_cfg3: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x005' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tps61052@33: failed to match any schema with compatible: ['ti,tps61052']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tps61052@33: failed to match any schema with compatible: ['ti,tps61052']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: ab8505 (stericsson,ab8505): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: ab8505 (stericsson,ab8505): gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: proximity@44 (sharp,gp2ap002s00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: accel@18 (bosch,bma254): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/bosch,bma255.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
